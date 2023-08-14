//
//  CoffeeDetailScreen.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import SwiftUI

struct CoffeeDetailScreen: View {
    
    let coffeeOrder: CoffeeOrder
    
    var body: some View {
        VStack {
            Text(coffeeOrder.name)
            Text(coffeeOrder.coffeeName)
            Text(coffeeOrder.total, format: .currency(code: "USD"))
        }
    }
}

#Preview {
    CoffeeDetailScreen(coffeeOrder: CoffeeOrder(name: "Cosmo Krammer", coffeeName: "Cafe Latte", total: 4.50, size: .large))
}
