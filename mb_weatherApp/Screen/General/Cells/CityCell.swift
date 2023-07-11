//
//  CityCell.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 10/07/2023.
//

import SnapKit

protocol CityCellOutput {
    func config(with name: String)
}

final class CityCell: UITableViewCell {
    let stackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = R.color.raven()?.cgColor
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    // MARK: - Output
    
    func config(with name: String) {
        setupForReuse()
        nameLabel.text = name
    }
    
    // MARK: - Inits
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Preparation

private extension CityCell {
    func setup() {
        backgroundColor = .clear
        doLayout()
    }
    
    func doLayout() {
        addSubviews()
        configureConstraints()
    }

    func addSubviews() {
        addSubviews(stackView)
        stackView.addArrangedSubviews(
            nameLabel
        )
    }

    func configureConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview().inset(4)
            make.height.equalTo(50)
        }
    }
}

// MARK: - Private Actions

private extension CityCell {
    func setupForReuse() {
        nameLabel.text = nil
    }
}
