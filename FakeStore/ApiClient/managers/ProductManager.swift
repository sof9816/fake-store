//
//  ProductManager.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import Foundation

struct ProductManager {
    static func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        APIClient.get(endpoint: Endpoints.products) { (result: Result<[Product], Error>) in
            completion(result)
        }
    }
}
