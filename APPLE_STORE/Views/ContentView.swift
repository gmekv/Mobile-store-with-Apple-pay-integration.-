//
//  ContentView.swift
//  APPLE_STORE
//
//  Created by Giorgi Meqvabishvili on 02.02.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @ObservedObject var productViewModel = ProductViewModel()
    var columns: [GridItem] = [
            GridItem(.adaptive(minimum: 160), spacing: 20)
        ]
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(productViewModel.products, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                        
                    }}
                .padding()
            }
            .navigationTitle(Text("Store"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)

                } label: {
                    CartButton(numberofProducts: cartManager.products.count)
                    

                }
                
            }

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
