//
//  DesktopViewModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import Moya
import RxSwift
import RxCocoa

protocol DesktopViewModelInput {
    var apiText: BehaviorRelay<String> { get }
    var continueButtonTapped: PublishRelay<Void> { get }
    
    func setupRxObservers()
}

protocol DesktopViewModelOutput {
    var errorObservable: PublishRelay<ErrorType> { get }
    var showLoader: PublishRelay<Bool> { get }
}

typealias DesktopViewModel = DesktopViewModelInput & DesktopViewModelOutput

final class DefaultDesktopViewModel: ViewModel, DesktopViewModel {
    // MARK: - Input
    
    let apiText = BehaviorRelay<String>(value: "")
    let continueButtonTapped = PublishRelay<Void>()
    
    func setupRxObservers() {
        setupContinueButtonTappedObserver()
    }

    // MARK: - Output
    
    let errorObservable = PublishRelay<ErrorType>()
    let showLoader = PublishRelay<Bool>()
    
    // MARK: - Inits

    init(
        apiProvider: MoyaProvider<APIProvider>,
        actions: CoordinatorOutput? = nil
    ) {
        self.apiProvider = apiProvider
        self.navigation = Navigation(actions: actions)
        super.init()
        setupRxObservers()
    }
    
    let navigation: Navigation
    let apiProvider: MoyaProvider<APIProvider>
}

// MARK: - RxObservers

private extension DefaultDesktopViewModel {
    func setupContinueButtonTappedObserver() {
        continueButtonTapped
            .subscribe(onNext: { [weak self] in
                self?.showLoader.accept(true)
                self?.pingServer()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private Actions

private extension DefaultDesktopViewModel {
    func pingServer() {
        apiProvider.rx
            .request(.allAvailableCities(apiKey: apiText.value))
            .map(AllCitiesModel.self)
            .asObservable()
            .subscribe(
                onNext: { [weak self] model in
                    guard let self = self else { return }
                    self.showLoader.accept(false)
                    self.navigation.coordinator?.startCitiesListScreen.perform(param: self.apiText.value)
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    let errorType = self.errorType(error)
                    
                    self.errorObservable.accept(errorType)
                    self.showLoader.accept(false)
                }
            ).disposed(by: disposeBag)
    }
}


// MARK: - Navigation

extension DefaultDesktopViewModel {
    struct Navigation {
        init(actions: CoordinatorOutput? = nil) {
            self.coordinator = actions
        }

        // MARK: Internal
        
        let coordinator: CoordinatorOutput?
    }

    struct CoordinatorOutput {
        let startCitiesListScreen: Action<String>
    }
}
