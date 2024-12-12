//
//  ContactViewController.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit

class ContactViewController: UIViewController, ContactContentViewDelegate {
    
    let contentView: ContactContentView
    var contactManager: ContactManager
    var pokemonManager: PokemonManager
    var contact: Contact?
    
    var isNew: Bool
    
    weak var coordinator : HomeCoordinator?
    
    init(isNew: Bool, contactManager: ContactManager, pokemonManager: PokemonManager){
        self.isNew = isNew
        self.contactManager = contactManager
        self.pokemonManager = pokemonManager
        self.contentView = ContactContentView(isNew: isNew)
        
        super.init(nibName: nil, bundle: nil)
        
        contentView.delegate = self
    }
    
    init(isNew: Bool, contactManager: ContactManager, pokemonManager: PokemonManager, contact: Contact){
        self.isNew = isNew
        self.contactManager = contactManager
        self.pokemonManager = pokemonManager
        self.contentView = ContactContentView(isNew: isNew)
        self.contact = contact
        
        super.init(nibName: nil, bundle: nil)
        
        contentView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavBar()
        
        Task {
            await contentView.tapRequestButton()
        }
    }
}


// MARK: - 구성요소 레이아웃

extension ContactViewController {
    
    private func setupUI(){
        view.addSubview(contentView)
                
        view.backgroundColor = Colors.white
        
        contentView.snp.makeConstraints { make in
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
        
        let rightButton = UIBarButtonItem(title:"apply", style: .plain, target: self, action: #selector(tapApplyButton))

        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = isNew ? "새로운 연락처" : "-"
    }
    
    
}


// MARK: - 각종 이벤트 관리

extension ContactViewController {
    func tapRequestButton() async -> PokemonResponse {
        return await pokemonManager.fetchRandomPokemon()
    }
    
    @objc func tapApplyButton() {
        guard let pokemon = pokemonManager.currentPokemon else {
            return
        }
        
        contactManager.createNewContact(name: contentView.nameTextField.text ?? "", mobile: contentView.mobileTextField.text ?? "", pokemon: pokemon)
        
        coordinator?.goBackToHome()
        AppHelpers.showAlert(title: "저장 성공", message: "새로운 연락처가 추가되었습니다.")
    }
}
