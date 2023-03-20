//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Justin Hold on 10/5/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: SharedOrder
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("State", text: $order.state)
                TextField("Zip Code", text: $order.zipCode)
            }
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Order Checkout")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: SharedOrder())
    }
}
