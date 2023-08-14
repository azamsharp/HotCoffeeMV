//
//  Coffee.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import Foundation

enum CoffeeSize: String, Codable, CaseIterable, Identifiable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    
    var id: CoffeeSize { self }
}

struct CoffeeOrder: Identifiable, Codable, Hashable {
    var id: Int?
    let name: String
    let coffeeName: String
    let total: Double
    let size: CoffeeSize
}
