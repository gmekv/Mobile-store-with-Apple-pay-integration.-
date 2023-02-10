//
//  ProductsModel.swift
//  AppleStore
//
//  Created by Giorgi Meqvabishvili on 02.02.23.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
