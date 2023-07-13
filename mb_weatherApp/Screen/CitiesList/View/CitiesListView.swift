//
//  CitiesListView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 10/07/2023.
//

import SnapKit

protocol CitiesListViewInput {
    func updateLastSelected(with names: [String])
    func updateWith(filteredCities: [String], isSearching: Bool)
    func clearTextField()
}

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
    
    // TODO: make a new Component SearchBarView
    let searchStackView: UIStackView = {
        let stackView: UIStackView = .create()
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
    
    // TODO: add Header to TableView
    let lastSelectedStackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.isHidden = true
        return stackView
    }()
    let lastSelectedLabel: UILabel = {
        let label: UILabel = .create()
        label.text = R.string.localizable.lastSelected()
        label.textColor = R.color.raven()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    let lastSelectedTableView: UITableView = {
        let tableView: UITableView = .create()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    // TODO: add Header to TableView
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
    
    // TODO: add EmptyState as Cell
    let noCityFoundLabel: UILabel = {
        let label: UILabel = .create()
        label.text = R.string.localizable.noCityFound()
        label.textColor = R.color.raven()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.isHidden = true
        return label
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
            lastSelectedStackView,
            selectCityLabel,
            allCitiesTableView,
            noCityFoundLabel,
            UIView()
        )
        searchStackView.addArrangedSubviews(
            searchImageView,
            textField
        )
        lastSelectedStackView.addArrangedSubviews(
            lastSelectedLabel,
            lastSelectedTableView
        )
    }

    func configureConstraints() {
        stackView.expandToSuperview()

        searchImageView.snp.makeConstraints { make in
            make.width.height.equalTo(32)
        }
        lastSelectedTableView.snp.makeConstraints { make in
            make.height.equalTo(174)
        }
        allCitiesTableView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(100)
        }
    }
}

// MARK: - Input

extension CitiesListView: CitiesListViewInput {
    func updateLastSelected(with names: [String]) {
        lastSelectedStackView.isHidden = names.isEmpty
        lastSelectedTableView.reloadData()
    }
    
    func updateWith(filteredCities: [String], isSearching: Bool) {
        allCitiesTableView.reloadData()
        allCitiesTableView.isHidden = filteredCities.isEmpty && isSearching
        lastSelectedTableView.reloadData()
        lastSelectedStackView.isHidden = !filteredCities.isEmpty || isSearching
        noCityFoundLabel.isHidden = !filteredCities.isEmpty || !isSearching
    }
    
    func clearTextField() {
        textField.text = ""
    }
}
