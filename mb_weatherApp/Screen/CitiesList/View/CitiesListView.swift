//
//  CitiesListView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 10/07/2023.
//

import SnapKit

final class CitiesListView: UIView {
    let stackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
        stackView.distribution = .fill
        return stackView
    }()
    
    
    let searchStackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fill
        return stackView
    }()
    let searchImageView: UIImageView = {
        let imageView: UIImageView = .create()
        imageView.image = R.image.icSearch()
        return imageView
    }()
    let textField: UITextField = {
        let textField: UITextField = .create()
        textField.backgroundColor = R.color.ebonyClay()
        textField.textColor = R.color.raven()
        textField.placeholder = R.string.localizable.cityName()
        textField.layer.cornerRadius = 10
        textField.font = .systemFont(ofSize: 16, weight: .bold)
        textField.leftView = UIView(frame: CGRect(x: 8, y: 8, width: 16, height: 16))
        textField.leftViewMode = .always
        textField.tintColor = R.color.brightSun()
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    let recentlySearchedLabel: UILabel = {
        let label: UILabel = .create()
        label.text = R.string.localizable.recentyleSearched()
        label.textColor = R.color.raven()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    let recentlySelectedTableView: UITableView = {
        let tableView: UITableView = .create()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    let selectCityLabel: UILabel = {
        let label: UILabel = .create()
        label.text = R.string.localizable.selectCity()
        label.textColor = R.color.raven()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    let allCitiesTableView: UITableView = {
        let tableView: UITableView = .create()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Preparation

private extension CitiesListView {
    func setup() {
        doLayout()
    }
    
    func doLayout() {
        addSubviews()
        configureConstraints()
    }

    func addSubviews() {
        addSubviews(stackView)
        stackView.addArrangedSubviews(
            searchStackView,
            recentlySearchedLabel,
            recentlySelectedTableView,
            selectCityLabel,
            allCitiesTableView,
            UIView()
        )
        searchStackView.addArrangedSubviews(
            searchImageView,
            textField
        )
    }

    func configureConstraints() {
        stackView.expandToSuperview()

        searchImageView.snp.makeConstraints { make in
            make.width.height.equalTo(32)
        }
        recentlySelectedTableView.snp.makeConstraints { make in
            make.height.equalTo(174)
        }
        allCitiesTableView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(100)
        }
    }
}
