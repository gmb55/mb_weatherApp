//
//  Array+removingDuplicates.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 11/07/2023.
//

import Foundation

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0).isNone
        }
    }
}
