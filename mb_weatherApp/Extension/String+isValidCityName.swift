//
//  String+isValidCityName.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 13/07/2023.
//

import Foundation

extension String {
    func isValidCityName() -> Bool {
        let regexPattern = "^[a-zA-Z\u{0080}-\u{024F}\\s\\/\\-\\)\\(\\`\\.\\\"\\']+$"
        let regex = try! NSRegularExpression(pattern: regexPattern)
        let range = NSRange(location: 0, length: utf16.count)
        let matches = regex.matches(in: self, range: range)

        return isEmpty
            ? true
            : !matches.isEmpty
    }
}
