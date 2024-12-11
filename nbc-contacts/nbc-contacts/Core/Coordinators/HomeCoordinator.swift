//
//  HomeCoordinator.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var contactManager: ContactManager
    var pokemonManager: PokemonManager

    init(navigationController: UINavigationController, contactManager: ContactManager, pokemonManager: PokemonManager) {
        self.navigationController = navigationController
        self.contactManager = contactManager
        self.pokemonManager = pokemonManager
    }

    func start() {
        let homeVC = HomeViewController( contactManager: contactManager, pokemonManager: pokemonManager )
        
        homeVC.coordinator = self
                        
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func goToCreatorScreen() {
        let contactVC = ContactViewController(isNew: true, contactManager: contactManager, pokemonManager: pokemonManager)
        
        navigationController.pushViewController(contactVC, animated: true)
    }
    
    func goToDetailScreen() {
        let contactVC = ContactViewController(isNew: false, contactManager: contactManager, pokemonManager: pokemonManager)
        
        navigationController.pushViewController(contactVC, animated: true)
    }
}
