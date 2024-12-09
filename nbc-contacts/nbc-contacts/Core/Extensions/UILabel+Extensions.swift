//
//  UILabel+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit


// MARK: - Styling

extension UILabel {
    /// Home 화면의 친구목록 상단의 타이틀 스타일
    func applyHeaderTitleStyle() {
        self.text = "친구 목록"
        self.backgroundColor = .clear
        self.font = Fonts.h2
        self.textColor = Colors.label
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    
    
    
    
}


// MARK: - UILabel Utilities

extension UILabel {
    /// UILabel 에 줄간격을 쉽게 적용시켜 사용하기 위한 메소드
    /// 기본값을 설정하였으므로 아래 둘 중 하나를 선택하여 사용.
    /// - Parameters:
    ///   - lineSpacing: 각 줄 사이의 간격을 의미합니다.
    ///   - lineHeightMultiple: 각 줄의 line height 값을 입력한 값만큼 곱하여 변경합니다. 글자의 위로 < 글자크기 x 입력숫자 >만큼 공간이 늘어난다고 생각하면 됩니다.
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString:NSMutableAttributedString
        
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
        
        /*
         위 메소드는 다음과 같은 형식으로 사용합니다.
         let label = UILabel()
         
         label.setLineSpacing(lineSpacing: 2.0)
         
         */
    }
}
