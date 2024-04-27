//
//  ApiClient.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import SwiftUI

struct APIClient {
    static let baseURL = URL(string: "https://fakestoreapi.com")!
    
    static func get<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(endpoint)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            handleResponse(data: data, response: httpResponse, completion: completion)
        }.resume()
    }
    
    static func post<T: Codable>(endpoint: String, body: T, completion: @escaping (Error?) -> Void) {
        // TODO: Implement POST method
    }
    
    private static func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse, completion: @escaping (Result<T, Error>) -> Void) {
        switch response.statusCode {
        case 200...299:
            if let data = data {
                decodeData(data: data, completion: completion)
            } else {
                completion(.failure(NetworkError.dataNotFound))
            }
        case 400...499:
            completion(.failure(NetworkError.clientError(statusCode: response.statusCode)))
        case 500...599:
            completion(.failure(NetworkError.serverError(statusCode: response.statusCode)))
        default:
            completion(.failure(NetworkError.unknownError(statusCode: response.statusCode)))
        }
    }
    
    private static func decodeData<T: Decodable>(data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedObject))
        } catch {
            completion(.failure(error))
        }
    }
}

enum NetworkError: LocalizedError {
    case invalidResponse
    case dataNotFound
    case clientError(statusCode: Int)
    case serverError(statusCode: Int)
    case unknownError(statusCode: Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .dataNotFound:
            return "Data not found."
        case .clientError(let statusCode):
            return "Client error: \(statusCode)"
        case .serverError(let statusCode):
            return "Server error: \(statusCode)"
        case .unknownError(let statusCode):
            return "Unknown error: \(statusCode)"
        }
    }
}


#Preview {
    ContentView()
}
