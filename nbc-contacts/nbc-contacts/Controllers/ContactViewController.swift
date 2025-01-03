//
//  ContactViewController.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit

class ContactViewController: UIViewController, ContactContentViewDelegate {
    
    let contactContentView: ContactContentView
    var contactViewModel: ContactViewModel
    var pokemonViewModel: PokemonViewModel
    
    var isNew: Bool
    
    weak var coordinator : HomeCoordinator?
    
    init(isNew: Bool, contactViewModel: ContactViewModel, pokemonViewModel: PokemonViewModel){
        self.isNew = isNew
        self.contactViewModel = contactViewModel
        self.pokemonViewModel = pokemonViewModel
        self.contactContentView = ContactContentView(isNew: isNew)
        
        super.init(nibName: nil, bundle: nil)
        
        contactContentView.delegate = self
        if isNew == false {
            contactContentView.setupSelectedContact(with: contactViewModel.getSelectedContact()!)
        }
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavBar()
        
        Task {
            if isNew {
                
                await contactContentView.tapRequestButton()
            }
        }
    }
}


// MARK: - 구성요소 레이아웃

extension ContactViewController {
    
    private func setupUI(){
        view.addSubview(contactContentView)
                
        view.backgroundColor = Colors.white
        
        contactContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


// MARK: - NavigationBar 설정

extension ContactViewController {
    
    func setupNavBar() {
        navigationController?.navigationBar.barTintColor = Colors.bg
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: Colors.label,
            .font: Fonts.h3Bold
        ]
        
        let rightButton = UIBarButtonItem(
            title: isNew ? "apply" : "edit",
            style: .plain,
            target: self,
            action: isNew ? #selector(tapApplyButton) : #selector(tapEditButton)
        )

        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = isNew ? "새로운 연락처" : contactViewModel.getSelectedContact()?.name ?? "?"
    }
}


// MARK: - 각종 이벤트 관리

extension ContactViewController {
    func tapRequestButton() async -> PokemonResponse {
        return await pokemonViewModel.fetchRandomPokemon()
    }
    
    @objc func tapApplyButton() {
        guard let pokemon = pokemonViewModel.getCurrentPokemon() else {
            return
        }
        
        contactViewModel.createNewContact(name: contactContentView.nameTextField.text ?? "", mobile: contactContentView.mobileTextField.text ?? "", pokemon: pokemon)
        
        coordinator?.goBackToHome()
        AppHelpers.showAlert(title: "저장 성공", message: "새로운 연락처가 추가되었습니다.")
    }
    
    @objc func tapEditButton() {
        guard let pokemon = pokemonViewModel.getCurrentPokemon() else {
            return
        }
        
        contactViewModel.updateContact(name: contactContentView.nameTextField.text ?? "", mobile: contactContentView.mobileTextField.text ?? "", pokemon: pokemon)
    }
}
