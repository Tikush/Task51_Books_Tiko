//
//  Coordinator.swift
//  Lecture 44
//
//  Created by Nika Kirkitadze on 01.07.21.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = TabBarViewController.instantiateFromStoryboard()
        vc.coordinator = self
        
        navigationController?.setViewControllers( [vc], animated: true)
        navigationController?.isNavigationBarHidden = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
