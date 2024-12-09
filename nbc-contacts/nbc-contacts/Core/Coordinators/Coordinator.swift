//
//  Coordinator.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
