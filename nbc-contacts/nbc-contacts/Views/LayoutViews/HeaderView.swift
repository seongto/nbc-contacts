//
//  HeaderView.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


final class HeaderView: UIView {
    
    let titleLabel: UILabel
    let createButton: UIButton
    
    weak var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        self.titleLabel = UILabel()
        self.createButton = UIButton()
        
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    

}
