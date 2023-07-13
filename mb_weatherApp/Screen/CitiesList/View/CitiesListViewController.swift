//
//  CitiesListViewController.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 10/07/2023.
//

import UIKit

final class CitiesListViewController: ViewController {
    // MARK: - Properties

    private let viewModel: CitiesListViewModel

    private var citiesListView: CitiesListView {
        guard let citiesListView = view as? CitiesListView else {
            fatalError("View is not set to DesktopView")
         }
        return citiesListView
    }

    // MARK: - Inits

    init(viewModel: CitiesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func loadView() {
        view = CitiesListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupRxObservers()
        setupTapGesture()
        setupTableViews()
    }
}

// MARK: - RxObservers

private extension CitiesListViewController {
    func setupRxObservers() {
        bindCityNameText()
        setupErrorObserver()
        setupFilteredCitiesObserver()
        setupLastSelectedObserver()
    }
    
    func bindCityNameText() {
        citiesListView.textField.rx.text.orEmpty
            .bind(to: viewModel.cityNameText)
            .disposed(by: disposeBag)
    }
    
    func setupErrorObserver() {
        viewModel.errorObservable
            .subscribe(onNext: { [weak self] errorType in
                self?.handleError(errorType)
            })
            .disposed(by: disposeBag)
    }
    
    func setupFilteredCitiesObserver() {
        viewModel.filteredCitiesNames
            .skip(1)
            .subscribe(onNext: { [weak self] names in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.citiesListView.updateWith(filteredCities: names, isSearching: self.viewModel.isSearching)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func setupLastSelectedObserver() {
        viewModel.lastSelectedCitiesNames
            .subscribe(onNext: { [weak self] names in
                DispatchQueue.main.async {
                    self?.citiesListView.updateLastSelected(with: names)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private Actions

private extension CitiesListViewController {
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func viewTapped() {
        citiesListView.textField.endEditing(true)
    }
    
    func handleError(_ type: ErrorType) {
        switch type {
        case .illegalCharacters:
            DispatchQueue.main.async {
                self.citiesListView.clearTextField()
            }
        default: break
        }
        prepareErrorAlert(type)
    }
    
    func prepareErrorAlert(_ type: ErrorType) {
        showErrorAlert(message: type.message)
            .subscribe(onNext: { [weak self] in
                self?.viewModel.setupRxObservers()
            })
            .disposed(by: self.disposeBag)
    }
    
    // TODO: add Wraper that will handle TableView in ViewModel
    func setupTableViews() {
        setupAllCitiesTableView()
        setupLastSelectedTableView()
    }
    
    func setupAllCitiesTableView() {
        let allCitiesTableView = citiesListView.allCitiesTableView
        allCitiesTableView.register(CityCell.self, forCellReuseIdentifier: String(describing: CityCell.self))
        allCitiesTableView.dataSource = self
        allCitiesTableView.delegate = self
    }
    
    func setupLastSelectedTableView() {
        let lastSelectedTableView = citiesListView.lastSelectedTableView
        lastSelectedTableView.register(CityCell.self, forCellReuseIdentifier: String(describing: CityCell.self))
        lastSelectedTableView.dataSource = self
        lastSelectedTableView.delegate = self
    }
}

// MARK: - TableView DataSource

// TODO: add Wraper that will handle TableView in ViewModel
extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let isLastSelected = tableView == citiesListView.lastSelectedTableView

        return viewModel.dataCount(forLast: isLastSelected)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCellIdentifier = String(describing: CityCell.self)
        let isLastSelected = tableView == citiesListView.lastSelectedTableView

        guard
            let cityCell = tableView.dequeueReusableCell(withIdentifier: cityCellIdentifier, for: indexPath) as? CityCell,
            let cityName = viewModel.cityName(for: indexPath.row, forLast: isLastSelected)
        else { return UITableViewCell() }

        cityCell.config(with: cityName)
        return cityCell
    }
}

// MARK: - TableView Delegate

// TODO: add Wraper that will handle TableView in ViewModel
extension CitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let isLastSelected = tableView == citiesListView.lastSelectedTableView
        viewModel.selectCityIndex(indexPath.row, forLast: isLastSelected)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
