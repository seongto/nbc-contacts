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
    
    var delegate: HeaderViewDelegate?
    
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
        [
            titleLabel,
            createButton
        ].forEach { self.addSubview($0) }
        
        titleLabel.applyHeaderTitleStyle()
        createButton.applyCreateButtonStyle()
        
        self.backgroundColor = Colors.bg.withAlphaComponent(0.5)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "친구 목록"
        
        // bottom border 삽입을 위해 frame 사이즈 지정
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        self.frame.size.width = width
        self.frame.size.height = 120
        self.layer.addBorder([.bottom], color: Colors.gray3, width: 0.5)
        
        
        self.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.width.equalTo(width)
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
        self.delegate?.tapAddButton()
    }
}
