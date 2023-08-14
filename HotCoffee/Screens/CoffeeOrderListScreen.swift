//
//  CoffeeOrderListScreen.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import SwiftUI

struct CoffeeOrderListScreen: View {
    
    @EnvironmentObject var model: Model
    @State private var isPresented: Bool = false
    
    private var sortedOrders: [CoffeeOrder] {
        model.orders.sorted { lhs, rhs in
            lhs.name < rhs.name
        }
    }
    
    var body: some View {
        List(sortedOrders) { order in
            NavigationLink(value: order) {
                Text(order.name)
            }
        }
        .navigationDestination(for: CoffeeOrder.self, destination: { coffeeOrder in
            CoffeeDetailScreen(coffeeOrder: coffeeOrder)
        })
        .task {
            do {
                try await model.loadOrders()
            } catch {
                print(error.localizedDescription)
            }
        }.navigationTitle("Orders")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Order") {
                        isPresented = true
                    }
                }
            })
            .sheet(isPresented: $isPresented, content: {
                AddCoffeeOrderScreen()
            })
    }
}

#Preview {
    NavigationStack {
        CoffeeOrderListScreen()
            .environmentObject(Model(httpClient: HTTPClient.shared))
    }
}
