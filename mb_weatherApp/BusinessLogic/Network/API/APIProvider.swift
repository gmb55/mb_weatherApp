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
    case forecast(city: String, apiKey: String)
    
    static let shared = MoyaProvider<APIProvider>()
}

extension APIProvider: Target {
    var params: TargetParams {
        switch self {
        case .currentWeather, .allAvailableCities, .forecast:
            return TargetParams(
                path: path,
                method: .get,
                task: .requestParameters(
                    parameters: requestParams,
                    encoding: URLEncoding.queryString
                )
            )
        }
    }
    
    var path: String {
        switch self {
        case .currentWeather:
            return "/weather"
        case .allAvailableCities:
            return "/find"
        case .forecast:
            return "/forecast"
        }
    }
    
    var requestParams: [String: Any] {
        switch self {
        case let .currentWeather(city, apiKey):
            return [
                "q": city,
                "appid": apiKey,
                "units": "metric",
            ]
        case let .allAvailableCities(apiKey):
            return [
                "q": "allCities",
                "appid": apiKey,
            ]
        case let .forecast(city, apiKey):
            return [
                "q": city,
                "cnt": 4,
                "appid": apiKey,
                "units": "metric",
            ]
        }
    }
}
