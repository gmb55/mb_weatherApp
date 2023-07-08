//
//  APITextViewModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import RxSwift
import RxCocoa

protocol APITextFieldViewModelInput {
    var text: BehaviorRelay<String> { get }
}

final class APITextFieldViewModel: ViewModel {
    let text = BehaviorRelay<String>(value: "")
    
    override init() {
        super.init()
        setupRxObservers()
    }
}

// MARK: - Preparation

private extension APITextFieldViewModel {
    func setupRxObservers() {
        setupTextObserver()
    }

    func setupTextObserver() {
        text.asObservable()
            .subscribe(onNext: { [weak self] text in
                // Handle the updated text
                print("New text: \(text)")
            })
            .disposed(by: disposeBag)
    }
}
