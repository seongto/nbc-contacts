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
    
    weak var coordinator: HomeCoordinator?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        createButton.applyCreateButtonStyle()
        
        self.backgroundColor = Colors.bg
        
        
        [titleLabel, createButton].forEach { addSubview($0) }
        
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
    private func tapCreateButton() {
        self.coordinator?.goToContactScreen()
    }
}
