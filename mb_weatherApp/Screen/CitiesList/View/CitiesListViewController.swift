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
        setupAllCitiesObserver()
    }
    
    func bindCityNameText() {
        viewModel.cityNameText
            .bind(to: citiesListView.textField.rx.text)
            .disposed(by: disposeBag)
    }
    
    func setupErrorObserver() {
        viewModel.errorObservable
            .subscribe(onNext: { [weak self] errorMessage in
                self?.handleError(errorMessage)
            })
            .disposed(by: disposeBag)
    }
    
    func setupAllCitiesObserver() {
        viewModel.allCitiesModels
            .subscribe(onNext: { [weak self] models in
                self?.citiesListView.allCitiesTableView.reloadData()
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
    
    func handleError(_ message: String) {
        self.showErrorAlert(message: message)
            .subscribe(onNext: {
                self.viewModel.setupRxObservers()
            })
            .disposed(by: self.disposeBag)
    }
    
    private func setupTableViews() {
        let allCitiesTableView = citiesListView.allCitiesTableView
        allCitiesTableView.register(CityCell.self, forCellReuseIdentifier: String(describing: CityCell.self))
        allCitiesTableView.dataSource = self
        allCitiesTableView.delegate = self

        let recentlySelectedTableView = citiesListView.recentlySelectedTableView
        recentlySelectedTableView.register(CityCell.self, forCellReuseIdentifier: String(describing: CityCell.self))
        recentlySelectedTableView.dataSource = self
        recentlySelectedTableView.delegate = self
    }
}

// MARK: - TableView DataSource

extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == citiesListView.recentlySelectedTableView {
            return 3
        }
        return viewModel.allCitiesModels.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCellIdentifier = String(describing: CityCell.self)
        guard let cityCell = tableView.dequeueReusableCell(withIdentifier: cityCellIdentifier, for: indexPath) as? CityCell else {
            return UITableViewCell()
        }
        let city = viewModel.allCitiesModels.value[indexPath.row]
        cityCell.config(with: city.name)
        return cityCell
    }
}

// MARK: - TableView Delegate

extension CitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == citiesListView.recentlySelectedTableView {
            let test = ""
        } else if tableView == citiesListView.allCitiesTableView {
            viewModel.cityIndex.accept(indexPath.row)
        }
    }
}
