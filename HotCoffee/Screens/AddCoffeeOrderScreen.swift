//
//  AddCoffeeOrderScreen.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import SwiftUI

struct AddCoffeeOrderScreen: View {
    
    @EnvironmentObject private var model: Model
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var total: Double = 0.0
    @State private var size: CoffeeSize = .medium
    
    private var isFormValid: Bool {
        return true 
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Coffee Name", text: $coffeeName)
            TextField("Total", value: $total, format: .number)
            
            Picker("Coffee Size", selection: $size) {
                ForEach(CoffeeSize.allCases) { size in
                    Text(size.rawValue)
                }
            }.pickerStyle(.segmented)
            
            HStack {
                Spacer()
                Button("Place Order") {
                    Task {
                       let order = CoffeeOrder(name: name, coffeeName: coffeeName, total: total, size: size)
                        do {
                            try await model.placeOrder(coffeeOrder: order)
                            dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }.buttonStyle(.borderedProminent)
                Spacer()
            }
        }
    }
}

#Preview {
    AddCoffeeOrderScreen()
        .environmentObject(Model(httpClient: HTTPClient.shared))
}
