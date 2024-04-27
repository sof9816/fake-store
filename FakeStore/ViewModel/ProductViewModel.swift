//
//  ProductViewModel.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() {
        ProductManager.fetchProducts { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products
                }
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
    }
}
