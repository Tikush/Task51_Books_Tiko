//
//  HomeViewModel.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    
    func fetchBooks(completion: @escaping((Result<[Book], Error>) -> Void))
    func fetchAuthors(completion: @escaping((Result<[Author], Error>) -> Void))
    
    var controller: CoordinatorDelegate { get }
    init(with controller: CoordinatorDelegate)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(with controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchBooks(completion: @escaping((Result<[Book], Error>) -> Void)) {
        controller.coordinator?.homeServiceManager?.fetchBooks(completion: completion)
    }
    
    func fetchAuthors(completion: @escaping((Result<[Author], Error>) -> Void)) {
        controller.coordinator?.homeServiceManager?.fetchAuthors(completion: completion)
    }
}
