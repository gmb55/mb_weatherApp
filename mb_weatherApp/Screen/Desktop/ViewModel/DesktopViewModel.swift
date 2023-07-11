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
    var errorObservable: PublishRelay<String> { get }
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
    
    let errorObservable = PublishRelay<String>()
    
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
                    self?.navigation.coordinator?.startCitiesListScreen.perform(param: ())
                },
                onError: { [weak self] error in
                    self?.handleError(error)
                    
                }
            ).disposed(by: disposeBag)
    }
    
    func handleError(_ error: Error) {
        if let apiError = error as? MoyaError,
           let response = apiError.response,
           response.statusCode != 200 {
            let errorMessage = getErrorMessage(forStatusCode: response.statusCode)
            errorObservable.accept(errorMessage)
        } else {
            errorObservable.accept(error.localizedDescription)
        }
    }

    func getErrorMessage(forStatusCode: Int) -> String {
        forStatusCode == 401
            ? R.string.localizable.unauthorizedErrorMessage()
            : R.string.localizable.badRequestErrorMessage()
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
        let startCitiesListScreen: Action<()>
    }
}
