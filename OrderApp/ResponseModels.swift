//
//  ResponseModels.swift
//  OrderApp
//
//  Created by Philip on 12.04.2021.
//

import Foundation

struct MenuResponse: Codable {
    let items: [MenuItem]
}

struct CategoriesResponse: Codable {
    let categories: [String]
}

struct OrderResponse: Codable {
    let prepTime:Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
    
}
