//
//  File.swift
//  APPLE_STORE
//
//  Created by Giorgi Meqvabishvili on 08.02.23.
//

import Foundation


class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    let paymentHandler = PaymentHandler()
    @Published  var paymentSuccess = false
    
    func addToCart(product: Product) {
        products.append(product)
        total += Int(product.price)
    }
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id}
        total -= Int(product.price)
        }
    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = []
            self.total = 0
        }
    }
    }

