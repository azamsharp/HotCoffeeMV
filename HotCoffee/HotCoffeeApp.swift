//
//  HotCoffeeApp.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import SwiftUI

@main
struct HotCoffeeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CoffeeOrderListScreen()
                    .environmentObject(Model(httpClient: HTTPClient.shared))
            }
        }
    }
}
