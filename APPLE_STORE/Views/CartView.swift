//
//  CartView.swift
//  APPLE_STORE
//
//  Created by Giorgi Meqvabishvili on 08.02.23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.paymentSuccess {
                Text("Thank you for your purchase")
            } else {
                
                
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) {
                        product in
                        ProductRow(product: product)
                    }
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("$\(cartManager.total).00")
                    }
                    .padding()
                    PaymentButton(action: cartManager.pay)
                        .padding()
                } else { Text("You cart is empty")
                    
                }}}
                .navigationTitle(Text("My cart"))
                .padding(.top)
                .onDisappear {
                    if cartManager.paymentSuccess {
                        cartManager.paymentSuccess = false
                    }
                }
    }}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
