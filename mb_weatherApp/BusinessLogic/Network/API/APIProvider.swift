//
//  APIProvider.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 09/07/2023.
//

import Moya
import RxSwift

enum APIProvider {
    case currentWeather(city: String, apiKey: String)
    case allAvailableCities(apiKey: String)
    
    static let shared = MoyaProvider<APIProvider>()
}

extension APIProvider: Target {
    var params: TargetParams {
        switch self {
        case let .currentWeather(city, apiKey):
            return TargetParams(
                path: APIEndpoint.currentWeather.rawValue,
                method: .get,
                task: .requestParameters(
                    parameters: [
                        "q": city,
                        "appid": apiKey,
                    ],
                    encoding: URLEncoding.queryString
                )
            )
        case .allAvailableCities(let apiKey):
            return TargetParams(
                path: APIEndpoint.allAvailableCities.rawValue,
                method: .get,
                task: .requestParameters(
                    parameters: [
                        "q": "allCities",
                        "appid": apiKey
                    ],
                    encoding: URLEncoding.queryString
                )
            )
        }
    }
}
