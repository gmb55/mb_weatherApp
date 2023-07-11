//
//  AllCitiesModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 09/07/2023.
//

import Foundation

struct AllCitiesModel: Decodable {
    let message: String
    let code: String
    let count: Int
    let cities: [City]
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case code = "cod"
        case count = "count"
        case cities = "list"
    }
}
