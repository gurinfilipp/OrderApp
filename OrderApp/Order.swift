//
//  Order.swift
//  OrderApp
//
//  Created by Philip on 12.04.2021.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
    
}
