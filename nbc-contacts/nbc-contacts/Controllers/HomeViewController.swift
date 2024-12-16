//
//  HomeViewController.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController, HeaderViewDelegate, ContentViewDelegate {
    
    let headerView: HeaderView = HeaderView()
    let homeContentView: HomeContentView = HomeContentView()
    var contactViewModel: ContactViewModel
    var pokemonViewModel: PokemonViewModel
    
    weak var coordinator : HomeCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.delegate = self
        homeContentView.delegate = self
        refreshContacts()
    }
    
    init(contactViewModel: ContactViewModel, pokemonViewModel: PokemonViewModel) {
        self.contactViewModel = contactViewModel
        self.pokemonViewModel = pokemonViewModel
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        refreshContacts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}


// MARK: - 구성요소 레이아웃 및 액션 매핑

extension HomeViewController {
    func setupUI() {
        [
            headerView,
            homeContentView
        ].forEach { view.addSubview($0) }
        
        view.backgroundColor = Colors.bg
        
        
        headerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        homeContentView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}


// MARK: - 각종 이벤트 관리

extension HomeViewController {
    func tapAddButton() {
        coordinator?.goToCreatorScreen()
    }
    
    func refreshContacts() {
        let data = contactViewModel.getContactAll()
        
        homeContentView.refreshContacts(data: data)
    }
    
    func tapCellBridge(with contact: Contact) {
        contactViewModel.selectContact(contact: contact)
        coordinator?.goToDetailScreen()
    }
}
