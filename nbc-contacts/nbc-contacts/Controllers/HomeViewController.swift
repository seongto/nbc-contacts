//
//  HomeViewController.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    let headerView: HeaderView
    let contentView: HomeContentView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // contentView 데이터 정보 리프레시 함수 넣어주기
    }
    
    init(headerView: HeaderView, homeContentView: HomeContentView) {
        self.headerView = headerView
        self.contentView = homeContentView
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
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


