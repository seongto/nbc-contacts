//
//  HeaderView.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


final class HeaderView: UIView {
    
    let titleLabel: UILabel = UILabel()
    let createButton: UIButton = UIButton()
    
    var coordinator: HomeCoordinator?
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        setupUI()
        mapButtons()
    }
    
}

// MARK: - 구성요소 레이아웃 및 액션 매핑

extension HeaderView {
    private func setupUI() {
        titleLabel.applyHeaderTitleStyle()
        titleLabel.text = "친구 목록"
        createButton.applyCreateButtonStyle()
        createButton.setTitle("추가", for: .normal)
        
        self.backgroundColor = Colors.bg
        
        
        [titleLabel, createButton].forEach { self.addSubview($0) }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.centerX.equalToSuperview()
        }
        
        createButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(Layouts.padding)
        }
    }
    
    private func mapButtons() {
        createButton.applyButtonAction(action: tapCreateButton)
    }
}
    

// MARK: - 액션 관리

extension HeaderView {
    func tapCreateButton() {
        self.coordinator?.goToCreatorScreen()
    }
}
