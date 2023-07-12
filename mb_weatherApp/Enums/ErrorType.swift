//
//  ErrorType.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 11/07/2023.
//

import Foundation

enum ErrorType {
    case badRequest
    case unauthorized
    case failReadData
    case illegalCharacters
    case failReadFromFile
    case fileNotFound
    
    var message: String {
        switch self {
        case .badRequest:
            return R.string.localizable.badRequestErrorMessage()
        case .unauthorized:
            return R.string.localizable.unauthorizedErrorMessage()
        case .failReadData:
            return R.string.localizable.dataReadErrorMessage()
        case .illegalCharacters:
            return R.string.localizable.illegalCharactersErrorMessage()
        case .failReadFromFile:
            return R.string.localizable.errorCitiesFromFileMessage()
        case .fileNotFound:
            return R.string.localizable.errorCitiesNoFileMessage()
        }
    }
}
