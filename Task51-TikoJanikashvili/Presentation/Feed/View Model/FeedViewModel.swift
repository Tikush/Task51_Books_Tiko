//
//  FeedViewModel.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 14.07.21.
//

import Foundation

protocol FeedViewModelProtocol: AnyObject {
    func fetchAuthors(completion: @escaping((Result<[Author], Error>) -> Void))
    
    var controller: CoordinatorDelegate { get }
    init(with controller: CoordinatorDelegate)
}

final class FeedViewModel: FeedViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(with controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchAuthors(completion: @escaping ((Result<[Author], Error>) -> Void)) {
        controller.coordinator?.feedServiceManager?.fetchAuthors(completion: completion)
    }
}
