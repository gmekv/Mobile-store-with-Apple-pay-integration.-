//
//  CartButton.swift
//  APPLE_STORE
//
//  Created by Giorgi Meqvabishvili on 08.02.23.
//

import SwiftUI

struct CartButton: View {
    var numberofProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
            if numberofProducts > 0 {
                Text("\(numberofProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.red)
                    .cornerRadius(50)
            }
        }


    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberofProducts: 1)
    }
}
