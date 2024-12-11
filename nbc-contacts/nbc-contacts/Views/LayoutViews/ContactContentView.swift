//
//  ContactContentView.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import SnapKit
import Combine


class ContactContentView: UIView {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let profileImageView = UIImageView()
    let requestButton = UIButton()
    let nameFieldLabel = UILabel()
    let mobileFieldLabel = UILabel()
    let nameTextField = UITextField()
    let mobileTextField = UITextField()
    
    let redBg = UIView()
    let horizontalLine = UIView()
    let lastView = UIView()

    var isNew: Bool
    var cancellables: Set<AnyCancellable> = [] // Combine 구독 유지를 위한 스토어
    var delegate: ContactContentViewDelegate?
    
    
    init(isNew: Bool) {
        self.isNew = isNew
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - 구성요소 레이아웃

extension ContactContentView {
    func setupUI() {
        [
            redBg,
            horizontalLine,
            profileImageView,
            requestButton,
            nameFieldLabel,
            mobileFieldLabel,
            nameTextField,
            mobileTextField,
            lastView
        ].forEach { contentView.addSubview($0) }
        
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)
        
        
        // MARK: - 각 UI 스타일 적용
        
        profileImageView.applyProfileImageStyle(size: CGFloat(200))
        requestButton.applyRequestPokemonButtonStyle()
        requestButton.applyButtonAction(action: tapRequestButton)
        
        nameFieldLabel.applyFieldLabelStyle()
        mobileFieldLabel.applyFieldLabelStyle()
        
        nameTextField.applyInputStyle(placeholder: "이름을 입력해주세요.")
        nameTextField.applyLengthLimit(limit: 10, cancellables: &cancellables)
        mobileTextField.applyInputStyle(placeholder: "010-0000-0000 양식으로 입력해주세요.")
        mobileTextField.applyLengthLimit(limit: 15, cancellables: &cancellables)
        
        
        // MARK: - 기타 UI 설정 및 레이아웃
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.white
        scrollView.backgroundColor = Colors.white
        contentView.backgroundColor = Colors.white
        redBg.backgroundColor = UIColor.red
        horizontalLine.backgroundColor = Colors.darkGray
        lastView.backgroundColor = Colors.white
        
        nameFieldLabel.text = "이름"
        mobileFieldLabel.text = "연락처"
        mobileTextField.keyboardType = .phonePad
                
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
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
        
        lastView.snp.makeConstraints { make in
            make.top.equalTo(mobileTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(Layouts.padding)
            make.height.equalTo(10)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
    }
}


// MARK: - 액션 관리

extension ContactContentView {
    func tapRequestButton() async {
        guard let pokemon = await delegate?.tapRequestButton() else {
            return
        }
                
        pokemon.sprites.frontDefault.loadAsyncImage { [weak self] image in
            self?.profileImageView.image = image ?? UIImage()
        }
    }
}
