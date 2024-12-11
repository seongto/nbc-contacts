//
//  UITextView+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import SnapKit
import Combine

extension UITextField {
    func applyInputStyle(isLast: Bool) {
        self.backgroundColor = Colors.gray6.withAlphaComponent(0.3)
        self.borderStyle = .roundedRect
        self.placeholder = "입력바란다..."
        self.returnKeyType = isLast ? .done : .next
        self.isUserInteractionEnabled = true
        
        
//        if !isLast {
//            self.becomeFirstResponder()
//        }
//        
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


// MARK: - 메소드 관리

extension UITextField {
    func applyLengthLimit(limit: Int, cancellables: inout Set<AnyCancellable>) {
        self.publisher(for: \.text)
            .compactMap { $0 }
            .sink { [weak self] text in
                if text.count > limit {
                    self?.text = String(text.prefix(limit))
                }
            }
            .store(in: &cancellables)
    }
}
