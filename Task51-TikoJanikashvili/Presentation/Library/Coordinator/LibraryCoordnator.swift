//
//  LibraryCoordnator.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 12.07.21.
//

import UIKit

final class LibraryCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        let vc = LibraryViewController.instantiateFromStoryboard()
        vc.tabBarItem.image = UIImage(named: "ic_library")
        vc.title = "Library"
        
        self.navigationController?.viewControllers = [vc]
    }
    
    func start() {
        
    }
}

