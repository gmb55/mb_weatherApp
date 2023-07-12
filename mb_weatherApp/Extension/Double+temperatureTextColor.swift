//
//  Double+temperatureTextColor.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 12/07/2023.
//

import UIKit

extension Double {
    func temperatureTextColor() -> UIColor {
        switch self {
        case ..<10:
            return .blue
        case 10..<20:
            return .black
        default:
            return .red
        }
    }
}
