//
//  HomeCoordinator.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var contactViewModel: ContactViewModel
    var pokemonViewModel: PokemonViewModel

    init(navigationController: UINavigationController, contactViewModel: ContactViewModel, pokemonViewModel: PokemonViewModel) {
        self.navigationController = navigationController
        self.contactViewModel = contactViewModel
        self.pokemonViewModel = pokemonViewModel
    }

    func start() {
        let homeVC = HomeViewController( contactViewModel: contactViewModel, pokemonViewModel: pokemonViewModel )
        
        homeVC.coordinator = self
                        
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func goToCreatorScreen() {
        let contactVC = ContactViewController(isNew: true, contactViewModel: contactViewModel, pokemonViewModel: pokemonViewModel )
        
        contactVC.coordinator = self
       
        navigationController.pushViewController(contactVC, animated: true)
    }
    
    func goToDetailScreen() {
        let contactVC = ContactViewController(isNew: false, contactViewModel: contactViewModel, pokemonViewModel: pokemonViewModel)
        
        contactVC.coordinator = self
        
        contactVC.coordinator = self
        
        navigationController.pushViewController(contactVC, animated: true)
    }
    
    func goBackToHome() {
        navigationController.popViewController(animated: true)
    }
}
