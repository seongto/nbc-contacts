//
//  UIButton+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


extension UIButton {
    func applyCreateButtonStyle() {
        var config = UIButton.Configuration.plain()
        
        config.title = "추가"
        config.buttonSize = .medium
        config.titleAlignment = .center
        
        self.titleLabel?.font = Fonts.h3
        self.configuration = config
        
    }
}
