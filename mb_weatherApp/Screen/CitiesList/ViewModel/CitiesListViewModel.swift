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
    var cityNameText: BehaviorRelay<String> { get }
    var cityIndex: BehaviorRelay<Int> { get }
    
    func setupRxObservers()
}

protocol CitiesListViewModelOutput {
    var errorObservable: PublishRelay<String> { get }
    var allCitiesModels: BehaviorRelay<[City]> { get }
}

typealias CitiesListViewModel = CitiesListViewModelInput & CitiesListViewModelOutput

final class DefaultCitiesListViewModel: ViewModel, CitiesListViewModel {
    // MARK: - Input
    
    let cityNameText = BehaviorRelay<String>(value: "")
    let cityIndex = BehaviorRelay<Int>(value: 0)
    
    func setupRxObservers() {
        setupCityIndexObserver()
    }

    // MARK: - Output
    
    let errorObservable = PublishRelay<String>()
    let allCitiesModels = BehaviorRelay<[City]>(value: [])
    
    // MARK: - Inits

    init(
        actions: CoordinatorOutput? = nil
    ) {
        self.navigation = Navigation(actions: actions)
        super.init()
        setupRxObservers()
        prepareAllCities()
    }
    
    let navigation: Navigation
}

// MARK: - RxObservers

private extension DefaultCitiesListViewModel {
    func setupCityIndexObserver() {
        cityIndex
            .skip(1)
            .subscribe(onNext: { [weak self] index in
                self?.navigation.coordinator?.startDetailsScreen.perform(param: index)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private Actions

private extension DefaultCitiesListViewModel {
    func prepareAllCities() {
        if let fileURL = Bundle.main.url(
            forResource: Constants.Tag.citiesListFileName,
            withExtension: Constants.Tag.citiesListFileExtension
        ) {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let cities = try decoder.decode([City].self, from: data)

                allCitiesModels.accept(cities)
            } catch {
                errorObservable.accept(R.string.localizable.errorCitiesFromFileMessage())
            }
        } else {
            errorObservable.accept(R.string.localizable.errorCitiesNoFileMessage())
        }
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
        let startDetailsScreen: Action<Int>
    }
}
