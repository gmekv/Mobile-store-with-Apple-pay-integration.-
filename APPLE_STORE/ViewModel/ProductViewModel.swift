//
//  ProductViewModel.swift
//  AppleStore
//
//  Created by Giorgi Meqvabishvili on 02.02.23.
//

import Foundation
import Combine
final class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    private var cancellables = Set<AnyCancellable> ()

    
    init() {
        getproducts()
        print(products)
        print("sigma")
    }
    
    func getproducts() {
        print("Getting products...")
        guard let url = URL(string: "https://dummyjson.com/products") else {
            print("Invalid URL")
            return
        }
       

        URLSession.shared.dataTaskPublisher(for: url)
        
            .tryMap { (data, response) -> Data in
                print("Data received: \(String(describing: String(data: data, encoding: .utf8)))")
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print(data)
                    dump(response)
                    throw URLError(.badServerResponse)                }
                return data
                
            }
        
            .decode(type: ProductResponse.self, decoder: JSONDecoder())
        
            .receive(on: DispatchQueue.main)
        
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error Catching Products", error.localizedDescription)
                case .finished:
                    print("Finished fetching Products")
                    
                }
            } receiveValue: { [weak self] result in
                self?.products = result.products 
                dump(self?.products)
                
            }
            .store(in: &cancellables)
    }

}
