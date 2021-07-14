//
//  CoordinatorProtocol.swift
//  Lecture 44
//
//  Created by Nika Kirkitadze on 01.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var networkManager: NetworkManagerProtocol? { get }
    var homeServiceManager: HomeServicesManagerProtocol? { get }
    var feedServiceManager: FeedServiceManagerProtocol? { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proceedToBookDetails(with image: String)
}

extension CoordinatorProtocol {
    
    var networkManager: NetworkManagerProtocol? {
        set { print("") }
        get { nil }
    }

    var homeServiceManager: HomeServicesManagerProtocol? {
        set { print("") }
        get { nil }
    }
    
    var feedServiceManager: FeedServiceManagerProtocol? {
        set { print("") }
        get { nil }
    }
    
    func proceedToBookDetails(with image: String) {
        print("Book details")
    }
}
