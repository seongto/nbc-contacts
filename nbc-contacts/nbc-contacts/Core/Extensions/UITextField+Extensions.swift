//
//  UITextView+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import SnapKit

extension UITextField {
    func applyInputStyle() {
        self.backgroundColor = Colors.gray6.withAlphaComponent(0.3)
        self.borderStyle = .roundedRect
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftViewMode = .always
        
//        self.layer.cornerRadius = 10
//        self.layer.borderWidth = 1
//        self.layer.borderColor = Colors.gray1.cgColor
        
        self.textColor = Colors.label
        self.font = Fonts.p
        
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
    }
}
