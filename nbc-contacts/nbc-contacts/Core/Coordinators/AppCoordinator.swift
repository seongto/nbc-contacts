//
//  AppCoordinator.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit


class AppCoordinator: Coordinator {
    let contactViewModel = ContactViewModel()
    let pokemonViewModel = PokemonViewModel()
    
    var navigationController: UINavigationController
    var homeCoordinator: HomeCoordinator
    
    init( navigationController:UINavigationController) {
        self.navigationController = navigationController
        self.homeCoordinator = HomeCoordinator(navigationController: navigationController, contactViewModel: contactViewModel, pokemonViewModel: pokemonViewModel)
    }
    
    func start() {
        homeCoordinator.start()
    }
}

