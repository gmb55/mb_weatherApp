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
}
