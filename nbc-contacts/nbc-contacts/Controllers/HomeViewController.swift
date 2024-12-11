//
//  HomeViewController.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController, HeaderViewDelegate {
    
    let headerView: HeaderView = HeaderView()
    let contentView: HomeContentView = HomeContentView()
    var contactManager: ContactManager
    var pokemonManager: PokemonManager
    
    weak var coordinator : HomeCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // contentView 데이터 정보 리프레시 함수 넣어주기
        headerView.delegate = self
    }
    
    init(contactManager: ContactManager, pokemonManager: PokemonManager) {
        self.contactManager = contactManager
        self.pokemonManager = pokemonManager
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    
}


// MARK: - 구성요소 레이아웃 및 액션 매핑

extension HomeViewController {
    func setupUI() {
        view.backgroundColor = Colors.bg
        
        [ headerView, contentView].forEach { view.addSubview($0) }
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
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
}
