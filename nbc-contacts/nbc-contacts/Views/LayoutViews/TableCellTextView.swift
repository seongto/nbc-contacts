//
//  TableCellTextView.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import SnapKit


class TableCellTextView: UIView {
    
    let nameLabel: UILabel
    let mobileLabel: UILabel
    
    init() {
        self.nameLabel = UILabel()
        self.mobileLabel = UILabel()
        super.init()
        
        nameLabel.text = "name"
        mobileLabel.text = "000-000-0000"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - 구성요소 레이아웃 및 액션 매핑

extension TableCellTextView {
    private func setupUI() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [
            nameLabel,
            mobileLabel
        ].forEach { self.addSubview($0) }
        
        nameLabel.applyNameInCellStyle()
        mobileLabel.applyMobileInCellStyle()
        
        
    }
}
