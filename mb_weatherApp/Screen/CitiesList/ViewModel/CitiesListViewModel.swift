//
//  CitiesListViewModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 10/07/2023.
//

import Moya
import RxSwift
import RxCocoa

protocol CitiesListViewModelInput {
    var cityNameText: PublishRelay<String> { get }
    
    func setupRxObservers()
    func selectCityIndex(_ index: Int, forLast: Bool)
}

protocol CitiesListViewModelOutput {
    var errorObservable: PublishRelay<ErrorType> { get }
    var lastSelectedCitiesNames: BehaviorRelay<[String]> { get }
    var allCitiesNames: BehaviorRelay<[String]> { get }
    var filteredCitiesNames: BehaviorRelay<[String]> { get }
    var isSearching: Bool { get }
    
    func cityName(for index: Int, forLast: Bool) -> String?
    func dataCount(forLast: Bool) -> Int
}

typealias CitiesListViewModel = CitiesListViewModelInput & CitiesListViewModelOutput

final class DefaultCitiesListViewModel: ViewModel, CitiesListViewModel {
    // MARK: - Input
    
    let cityNameText = PublishRelay<String>()
    
    func setupRxObservers() {
        setupCityNameTextObserver()
    }
    
    func selectCityIndex(_ index: Int, forLast: Bool) {
        handleSelectedCityIndex(index, forLast: forLast)
    }

    // MARK: - Output
    
    let lastSelectedCitiesNames = BehaviorRelay<[String]>(value: [])
    let allCitiesNames = BehaviorRelay<[String]>(value: [])
    let filteredCitiesNames = BehaviorRelay<[String]>(value: [])
    var isSearching: Bool = false
    var errorObservable = PublishRelay<ErrorType>()
    
    func cityName(for index: Int, forLast: Bool) -> String? {
        let searchingDataBase = isSearching
            ? filteredCitiesNames
            : allCitiesNames
        let dataBase = forLast
            ? lastSelectedCitiesNames
            : searchingDataBase

        if index < dataBase.value.count {
            return dataBase.value[index]
        } else {
            errorObservable.accept(.failReadData)

            return nil
        }
    }
    
    func dataCount(forLast: Bool) -> Int {
        let lastSelectedDataCount = isSearching
            ? 0
            : min(lastSelectedCitiesNames.value.count, Constants.General.lastSelectedCitiesCount)

        let searchingDataCount = isSearching
            ? filteredCitiesNames.value.count
            : allCitiesNames.value.count

        return forLast
            ? lastSelectedDataCount
            : searchingDataCount
    }
    
    // MARK: - Inits

    init(
        apiKey: String,
        actions: CoordinatorOutput? = nil
    ) {
        self.apiKey = apiKey
        self.navigation = Navigation(actions: actions)
        super.init()
        setupRxObservers()
        prepareData()
    }
    
    let navigation: Navigation
    let apiKey: String
}

// MARK: - RxObservers

private extension DefaultCitiesListViewModel {
    func setupCityNameTextObserver() {
        cityNameText
            .skip(1)
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] text in
                self?.handleEnteredText(text)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private Actions

private extension DefaultCitiesListViewModel {
    func prepareData() {
        prepareRecentlySelected()
        prepareAllCities()
    }
    
    func prepareRecentlySelected() {
        let lastSelectedCitiesNames = Array(AppData.lastSelectedCitiesNames.reversed()).removingDuplicates()
        self.lastSelectedCitiesNames.accept(lastSelectedCitiesNames)
    }
    
    func prepareAllCities() {
        if let fileURL = Bundle.main.url(
            forResource: Constants.Tag.citiesListFileName,
            withExtension: Constants.Tag.citiesListFileExtension
        ) {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let cities = try decoder.decode([City].self, from: data)
                let citiesNames = cities.map { $0.name }.removingDuplicates()

                allCitiesNames.accept(citiesNames)
            } catch {
                errorObservable.accept(.failReadFromFile)
            }
        } else {
            errorObservable.accept(.fileNotFound)
        }
    }
    
    func handleSelectedCityIndex(_ index: Int, forLast: Bool) {
        if let cityName = cityName(for: index, forLast: forLast) {
            AppData.lastSelectedCitiesNames.append(cityName)
            prepareRecentlySelected()
            navigation.coordinator?.startDetailsScreen.perform(
                param: DefaultDetailsViewModel.DetailsModel(cityName: cityName, apiKey: apiKey)
            )
        }
    }
    
    func handleEnteredText(_ text: String) {
        isSearching = !text.isEmpty

        text.isValidCityName()
            ? filterDataBase(with: text)
            : errorObservable.accept(.illegalCharacters)
    }
    
    func filterDataBase(with text: String) {
        let filteredCitiesNames = isSearching
            ? allCitiesNames.value.filter { $0.lowercased().contains(text.lowercased()) }
            : []

        self.filteredCitiesNames.accept(filteredCitiesNames)
    }
}

// MARK: - Navigation

extension DefaultCitiesListViewModel {
    struct Navigation {
        init(actions: CoordinatorOutput? = nil) {
            self.coordinator = actions
        }

        // MARK: Internal
        
        let coordinator: CoordinatorOutput?
    }

    struct CoordinatorOutput {
        let startDetailsScreen: Action<DefaultDetailsViewModel.DetailsModel>
    }
}
