//
//  Product.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
