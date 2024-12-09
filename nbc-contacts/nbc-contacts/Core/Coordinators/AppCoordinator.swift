//
//  AppCoordinator.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit


class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        
        homeCoordinator.start()
    }
}
