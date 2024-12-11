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
    let textView = TableCellTextView()
    
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
        self.backgroundColor = Colors.bg
                
        [
            profileImageView,
            textView
        ].forEach { self.addSubview($0) }
        
        
        profileImageView.applyProfileImageStyle(size: CGFloat(60), mask: true)

        
        self.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Layouts.padding)
            make.centerY.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Layouts.padding)
            make.centerY.equalToSuperview()
        }
        
    }
    
}
