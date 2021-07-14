//
//  TabBarViewController.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 12.07.21.
//

import UIKit

class TabBarViewController: UITabBarController, CoordinatorDelegate, Storyboarded {
    
    private var homeCoordinator = HomeCoordinator()
    private var feedCoordinator = FeedCoordinator()
    private var libraryCoordinator = LibraryCoordinator()
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            homeCoordinator.navigationController!,
            feedCoordinator.navigationController!,
            libraryCoordinator.navigationController!
        ]
    }
}
