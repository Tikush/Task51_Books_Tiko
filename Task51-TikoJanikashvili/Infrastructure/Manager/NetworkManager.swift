//
//  NetworkManager.swift
//  BooksAppForThirdTeam
//
//  Created by Nana Jimsheleishvili on 08.07.21.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func get<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
//    private init() {}
    
    func get<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
