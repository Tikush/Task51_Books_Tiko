//
//  HomeServicesManagerProtocol.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import Foundation

enum EndPoint: String {
    case books = "https://private-anon-fa10842875-bookstore.apiary-mock.com/data/books"
    case authors = "https://private-anon-fa10842875-bookstore.apiary-mock.com/data/authors"
}

protocol HomeServicesManagerProtocol: AnyObject {
    func fetchHomeData()
//    func fetchProducts()
    func fetchProductDetails(with productId: String)
    
    func fetchBooks(completion: @escaping ((Result<[Book], Error>) -> Void))
    func fetchAuthors(completion: @escaping ((Result<[Author], Error>) -> Void))
    init(with networkMangaer: NetworkManagerProtocol)
}

final class HomeServicesManager: HomeServicesManagerProtocol {
    
    private let newtorkManger: NetworkManagerProtocol
    
    init(with networkMangaer: NetworkManagerProtocol) {
        self.newtorkManger = networkMangaer
    }
    
    func fetchBooks(completion: @escaping ((Result<[Book], Error>) -> Void)) {
        let url = EndPoint.books.rawValue
        
        NetworkManager.shared.get(url: url) { (result: Result<[Book], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
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
     
    func fetchHomeData() {
        print("Fetching home data...")
    }
//    func fetchProducts() {
//        print("Fetching products...")
//    }
    func fetchProductDetails(with productId: String) {}
}
