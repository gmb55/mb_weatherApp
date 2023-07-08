//
//  DesktopViewModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import RxSwift
import RxCocoa

protocol DesktopViewModelInput {
    var apiText: BehaviorRelay<String> { get }
    var continueButtonTapped: PublishRelay<Void> { get }
}

protocol DesktopViewModelOutput {}

typealias DesktopViewModel = DesktopViewModelInput & DesktopViewModelOutput

final class DefaultDesktopViewModel: ViewModel, DesktopViewModel {
    // MARK: - Input
    
    let apiText = BehaviorRelay<String>(value: "")
    let continueButtonTapped = PublishRelay<Void>()

    // MARK: - Output
    
    // MARK: - Inits

    init(actions: CoordinatorOutput? = nil) {
        self.navigation = Navigation(actions: actions)
        super.init()
        setupRxObservers()
    }
    
    let navigation: Navigation
}

// MARK: - RxObservers

private extension DefaultDesktopViewModel {
    func setupRxObservers() {
        setupAPITextObserver()
        setupContinueButtonTappedObserver()
        }
    
    func setupAPITextObserver() {
        apiText
            .subscribe(onNext: { text in
                
            })
            .disposed(by: disposeBag)
    }
    
    func setupContinueButtonTappedObserver() {
        continueButtonTapped
            .subscribe(onNext: { [weak self] in
                self?.navigation.coordinator?.startDetailsScreen.perform(param: ())
            })
            .disposed(by: disposeBag)
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
        let startDetailsScreen: Action<()>
    }
}
