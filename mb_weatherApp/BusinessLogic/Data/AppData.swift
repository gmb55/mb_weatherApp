//
//  AppData.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 11/07/2023.
//

import Foundation

final class AppData: NSObject {
    // MARK: - Input
    
    static var lastSelectedCitiesNames: [String] {
        get { UserDefaults.standard.stringArray(forKey: lastSelectedCitiesNamesKey) ?? [] }
        set { UserDefaults.standard.set(newValue, forKey: lastSelectedCitiesNamesKey) }
    }
    

    // MARK: - Private
    
    private static let keyPrefix = "weatherUserDefaults"
    private static let lastSelectedCitiesNamesKey = "\(keyPrefix).lastSelectedCitiesNames"
}
