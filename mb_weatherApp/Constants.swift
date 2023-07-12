//
//  Constants.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import Foundation

enum Constants {
    enum General {
        static let referenceUnit: CGFloat = 17
        static let lastSelectedCitiesCount: Int = 3
        static let celsiusDegreeSymbol = "\u{00B0}C"
        static let hPa = "hPa"
    }
    
    enum API {
        static var baseURL: URL? {
            return URL(string: "https://api.openweathermap.org/data/2.5")
        }
    }
    
    enum Tag {
        static let keyboardDismissableGestureRecognizer = "keyboardDismissableGestureRecognizer"
        static let citiesListFileName = "citiesList"
        static let citiesListFileExtension = "json"
    }
}
