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
        
        print("------")
        print(headerView.coordinator ?? "nil")
        
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func goToCreatorScreen() {
        let contactVC = ContactViewController(isNew: true)
        
        navigationController.pushViewController(contactVC, animated: true)
    }
    
    func goToDetailScreen() {
        let contactVC = ContactViewController(isNew: false)
        
        navigationController.pushViewController(contactVC, animated: true)
    }
}
