//
//  ContactContentView.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import SnapKit


class ContactContentView: UIView {
    
    let profileImageView = UIImageView()
    let requestButton = UIButton()
    let nameFieldLabel = UILabel()
    let mobileFieldLabel = UILabel()
    let nameTextField = UITextField()
    let mobileTextField = UITextField()
    
    let redBg = UIView()
    let horizontalLine = UIView()

    
    var isNew: Bool
    
    
    init(isNew: Bool) {
        self.isNew = isNew
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - 구성요소 레이아웃 및 액션 매핑
extension ContactContentView {
    func setupUI() {
        self.backgroundColor = Colors.green
        
        [
            redBg,
            horizontalLine,
            profileImageView,
            requestButton,
            nameFieldLabel,
            mobileFieldLabel,
            nameTextField,
            mobileTextField
        ].forEach { self.addSubview($0) }
        
        // MARK: - 각 UI 스타일 적용
        
        profileImageView.applyProfileImageStyle(size: CGFloat(200))
        requestButton.applyRequestPokemonButtonStyle()
        
        nameFieldLabel.applyFieldLabelStyle()
        mobileFieldLabel.applyFieldLabelStyle()
        
        nameTextField.applyInputStyle()
        mobileTextField.applyInputStyle()
        
        // MARK: - 기타 UI 설정 및 레이아웃
        
        redBg.backgroundColor = UIColor.red
        horizontalLine.backgroundColor = .darkGray
        
        
        nameFieldLabel.text = "이름"
        mobileFieldLabel.text = "연락처"
        mobileTextField.keyboardType = .phonePad
        
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }
        
        redBg.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(horizontalLine.snp.top)
        }
        
        requestButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.centerY.equalTo(requestButton)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        nameFieldLabel.snp.makeConstraints { make in
            make.top.equalTo(requestButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(Layouts.padding)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameFieldLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(Layouts.padding)
        }
        
        mobileFieldLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(Layouts.padding)
        }
        
        mobileTextField.snp.makeConstraints { make in
            make.top.equalTo(mobileFieldLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(Layouts.padding)
        }
    }
}
