//
//  ApiClient.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import Foundation

struct APIClient {
    static let baseURL = URL(string: "https://fakestoreapi.com")!
    
    static func get<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(endpoint)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data not found", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func post<T: Codable>(endpoint: String, body: T, completion: @escaping (Error?) -> Void) {
        // TODO: Implement POST method
    }
}
