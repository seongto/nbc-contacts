//
//  ContactViewController.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit

class ContactViewController: UIViewController {
    
    let contentView: ContactContentView
    
    var isNew: Bool
    
    init(isNew: Bool){
        self.isNew = isNew
        self.contentView = ContactContentView(isNew: isNew)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavBar()
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
        
        let rightButton = UIBarButtonItem(title:"apply", style: .plain, target: self, action: #selector(testman))

        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = isNew ? "새로운 연락처" : "-"
    }
    
    @objc func testman() {
        print("touched!")
    }
}

