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
    let scrollView = UIScrollView()

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
    }
}


// MARK: - 구성요소 레이아웃

extension ContactViewController {
    
    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.applyVerticalStyle()
        
        view.backgroundColor = Colors.white
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(scrollView.frameLayoutGuide)
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
        
        let rightButton = UIBarButtonItem()
            navigationItem.rightBarButtonItem = rightButton
    }
}
