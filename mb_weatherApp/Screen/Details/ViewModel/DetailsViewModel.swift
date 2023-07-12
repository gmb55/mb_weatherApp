//
//  DetailsViewModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

protocol DetailsViewModelInput {
    func setupRxObservers()
}

protocol DetailsViewModelOutput {
    var errorObservable: PublishRelay<ErrorType> { get }
    var dataModel: PublishRelay<DefaultDetailsViewModel.DetailsDataModel> { get }
    var showLoader: PublishRelay<Bool> { get }
}

typealias DetailsViewModel = DetailsViewModelInput & DetailsViewModelOutput

final class DefaultDetailsViewModel: ViewModel, DetailsViewModel {
    // MARK: - Input
    
    func setupRxObservers() {}
    
    // MARK: - Output
    
    let errorObservable = PublishRelay<ErrorType>()
    var dataModel = PublishRelay<DetailsDataModel>()
    let showLoader = PublishRelay<Bool>()
    
    // MARK: - Inits

    init(
        apiProvider: MoyaProvider<APIProvider>,
        model: DetailsModel
    ) {
        self.apiProvider = apiProvider
        self.model = model
        super.init()
        fetchData()
    }

    // MARK: - Internal
    
    struct DetailsDataModel {
        let weather: WeatherResponse
        let forecast: WeatherForecastResponse
    }

    struct DetailsModel {
        let cityName: String
        let apiKey: String
    }

    let apiProvider: MoyaProvider<APIProvider>
    let model: DetailsModel
}

// MARK: - Private Actions

private extension DefaultDetailsViewModel {
    func fetchData() {
        let currentWeatherRequest = apiProvider.rx
            .request(.currentWeather(city: model.cityName, apiKey: model.apiKey))
            .map(WeatherResponse.self)
            .asObservable()

        let forecastRequest = apiProvider.rx
            .request(.forecast(city: model.cityName, apiKey: model.apiKey))
            .map(WeatherForecastResponse.self)
            .asObservable()

        Observable.zip(currentWeatherRequest, forecastRequest)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] currentWeather, forecast in
                    guard let self = self else { return }

                    self.showLoader.accept(false)
                    self.dataModel.accept(
                        DetailsDataModel(weather: currentWeather, forecast: forecast)
                    )
                },
                onError: { [weak self] error in
                    guard let self = self else { return }

                    let errorType = self.errorType(error)
                    self.errorObservable.accept(errorType)
                    self.showLoader.accept(false)
                }
            )
            .disposed(by: disposeBag)
    }
}
