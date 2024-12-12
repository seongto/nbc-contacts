//
//  ContactTableViewCell.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


class ContactTableViewCell: UITableViewCell {
    static let id = "ContactTableViewCell"
    
    let profileImageView = UIImageView()
    let tabeCellTextView = UIView()
    let nameLabel: UILabel = UILabel()
    let mobileLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - 구성요소 레이아웃

extension ContactTableViewCell {
    private func setupUI() {
        [
            profileImageView,
            tabeCellTextView
        ].forEach { self.addSubview($0) }
        
        [
            nameLabel,
            mobileLabel
        ].forEach { tabeCellTextView.addSubview($0) }
        
        self.applyHomeTableCellStyle()
        profileImageView.applyProfileImageStyle(size: CGFloat(60), mask: true)
        nameLabel.applyNameInCellStyle()
        mobileLabel.applyMobileInCellStyle()
        
        self.backgroundColor = Colors.bg
        tabeCellTextView.backgroundColor = Colors.bg
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Layouts.padding)
            make.width.equalTo(60)
            make.centerY.equalToSuperview()
        }
        
        tabeCellTextView.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(Layouts.padding)
            make.trailing.equalToSuperview().inset(Layouts.padding)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        mobileLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}


// MARK: - 배열 데이터 매핑

extension ContactTableViewCell {
    func config(contact: Contact) {
        nameLabel.text = contact.name ?? "no name"
        mobileLabel.text = contact.mobile ?? "no mobile"
                
        if let imgUrl: String = contact.pokemon?.spriteFront {
            imgUrl.loadAsyncImage { [weak self] image in
                self?.profileImageView.image = image ?? UIImage()
            }
        } else {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        }
    }
}
