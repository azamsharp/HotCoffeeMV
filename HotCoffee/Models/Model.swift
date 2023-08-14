//
//  Model.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

// Aggregate Model

import Foundation

// Aggregate Model
@MainActor
class Model: ObservableObject {
    
    @Published var orders: [CoffeeOrder] = []
    var httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadOrders() async throws {
        let resource = Resource(url: APIs.orders.url, modelType: [CoffeeOrder].self)
        orders = try await httpClient.load(resource)
    }
    
    func placeOrder(coffeeOrder: CoffeeOrder) async throws {
        
        let coffeeOrderData = try JSONEncoder().encode(coffeeOrder)
        
        let resource = Resource(url: APIs.addOrder.url, method: .post(coffeeOrderData), modelType: CoffeeOrder.self)
        let savedCoffeeOrder = try await httpClient.load(resource)
        orders.append(savedCoffeeOrder)
    }
}
