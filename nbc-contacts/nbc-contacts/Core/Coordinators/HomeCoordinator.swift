//
//  HomeCoordinator.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let headerView = HeaderView()
        let homeContentView = HomeContentView()
        let homeVC = HomeViewController( headerView: headerView, homeContentView: homeContentView )
        
        headerView.coordinator = self
        
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func goToContactScreen() {
        let contactVC = ContactViewController()
        
        navigationController.pushViewController(contactVC, animated: true)
    }
}
