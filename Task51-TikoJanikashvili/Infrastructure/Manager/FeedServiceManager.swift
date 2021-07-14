//
//  FeedServiceManager.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 14.07.21.
//

import Foundation

protocol FeedServiceManagerProtocol: AnyObject {
    func fetchAuthors(completion: @escaping ((Result<[Author], Error>) -> Void))
    init(with networkManager: NetworkManagerProtocol)
    func fetchFeedData()
}

final class FeedServiceManager: FeedServiceManagerProtocol {
    
    private let networkManager: NetworkManagerProtocol!
    
    init(with networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchAuthors(completion: @escaping ((Result<[Author], Error>) -> Void)) {
        let url = EndPoint.authors.rawValue
        
        NetworkManager.shared.get(url: url) { (result: Result<[Author], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func fetchFeedData() {
        print("Fetch feed data...")
    }
}
