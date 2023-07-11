//
//  ForecastModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 09/07/2023.
//

import Foundation

struct WeatherForecast: Decodable {
    let cod: String
    let message: Int
    let count: Int
    let list: [WeatherForecastItem]
    let city: City
}

struct WeatherForecastItem: Decodable {
    let dt: TimeInterval
    let main: WeatherForecastMain
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case sys
        case dtTxt = "dt_txt"
    }
}

struct WeatherForecastMain: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int
    let groundLevel: Int
    let humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let state: String?
    let population: Int?
    let timezone: Int?
    let sunrise: TimeInterval?
    let sunset: TimeInterval?
}
