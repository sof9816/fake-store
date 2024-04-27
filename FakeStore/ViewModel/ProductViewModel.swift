//
//  ProductViewModel.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import SwiftUI
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        APIClient.get(endpoint: Endpoints.products) { (result: Result<[Product], Error>) in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products
                    completion(.success(products))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
