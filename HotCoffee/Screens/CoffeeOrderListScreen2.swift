//
//  CoffeeOrderListScreen2.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import SwiftUI

struct CoffeeOrderListScreen2: View {
    
    let httpClient: HTTPClient
    @State private var orders: [CoffeeOrder] = []
    
    private func loadOrders() async {
        let resource = Resource(url: APIs.orders.url, modelType: [CoffeeOrder].self)
        do {
            self.orders = try await httpClient.load(resource)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        List(orders) { order in
            Text(order.name)
        }.task {
           await loadOrders()
        }
    }
}

#Preview {
    CoffeeOrderListScreen2(httpClient: HTTPClient.shared)
}
