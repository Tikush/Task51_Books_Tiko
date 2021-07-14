//
//  FeedCoordinator.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 12.07.21.
//

import UIKit

final class FeedCoordinator: CoordinatorProtocol {
    
    var networkManager: NetworkManagerProtocol?
    var feedServiceManager: FeedServiceManagerProtocol?
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = FeedViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_feed")
        vc.title = "Feed"
        
        networkManager = NetworkManager()
        feedServiceManager = FeedServiceManager(with: networkManager!)
        self.navigationController?.viewControllers = [vc]
    }
    
    func start() {
        
    }
}

