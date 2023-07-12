//
//  Optional+isNone.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 11/07/2023.
//

import Foundation

extension Optional {
    var isNone: Bool {
        switch self {
        case .none: return true
        case .some: return false
        }
    }
}
