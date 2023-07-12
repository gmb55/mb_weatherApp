//
//  ViewModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import Moya
import RxCocoa
import RxSwift

class ViewModel {
    var disposeBag = DisposeBag()
    
    func errorType(_ error: Error) -> ErrorType {
        if let apiError = error as? MoyaError,
           let response = apiError.response,
           response.statusCode != 200 {
            return response.statusCode == 401
            ? .unauthorized
            : .badRequest
        } else {
            return .failReadData
        }
    }
}
