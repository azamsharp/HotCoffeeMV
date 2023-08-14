//
//  APIs.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import Foundation

enum APIs {
    
    case orders
    case addOrder
   
    private var baseURL: URL {
        URL(string: "https://island-bramble.glitch.me")!
    }
    
    var url: URL {
        switch self {
            case .orders:
                return baseURL.appendingPathComponent("/orders")
            case .addOrder:
                return baseURL.appendingPathComponent("/newOrder")
        }
    }
}
