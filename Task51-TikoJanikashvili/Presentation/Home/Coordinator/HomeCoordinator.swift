//
//  HomeCoordinator.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 12.07.21.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    var networkManager: NetworkManagerProtocol?
    var homeServiceManager: HomeServicesManagerProtocol?
    var navigationController: UINavigationController?

    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true

        let vc = HomeViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_home")
        vc.title = "Home"

        self.navigationController?.viewControllers = [vc]

        networkManager = NetworkManager()
        homeServiceManager = HomeServicesManager(with: networkManager!)
    }
    
    func start() {

    }
    
    func proceedToBookDetails(with image: String) {
        let vc = BookDetailsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.image = image
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
}
