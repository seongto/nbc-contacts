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
    /// 새로운 연락처 입력에 사용되는 텍스트필드 용 스타일
    /// - Parameter isLast: 엔터 입력 동작 변경을 위해 넣었으나 제대로 동작하지 않는다.
    func applyInputStyle(placeholder: String) {
        self.backgroundColor = Colors.gray6.withAlphaComponent(0.3)
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        
        self.textColor = Colors.label
        self.font = Fonts.p
        
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
    }
}


// MARK: - 메소드 관리

extension UITextField {
    
    /// 글자수 제한하는 기능을 Combine 공부할 겸 Combine을 통해 구현하였다.
    /// - Parameters:
    ///   - limit: 제한하고 싶은 글자수
    ///   - cancellables: 구독 상태 유지를 위해 스토어를 초기화하는 외부에서 관리.
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
