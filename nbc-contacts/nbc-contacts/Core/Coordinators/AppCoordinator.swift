//
//  AppCoordinator.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit


class AppCoordinator: Coordinator {
    let contactManager = ContactManager()
    let pokemonManager = PokemonManager()
    
    var navigationController: UINavigationController
    var homeCoordinator: HomeCoordinator
    
    init( navigationController:UINavigationController) {
        self.navigationController = navigationController
        self.homeCoordinator = HomeCoordinator(navigationController: navigationController, contactManager: contactManager, pokemonManager: pokemonManager)
    }
    
    func start() {
        homeCoordinator.start()
    }
}

