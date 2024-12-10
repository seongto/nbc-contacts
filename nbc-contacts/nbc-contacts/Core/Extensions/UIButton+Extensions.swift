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
        self.configuration = config // config를 통해 설정한 내용 적용하기
    }
    
    // 부모로부터 액션을 할당받아 버튼의 터치 동작과 연결.
    func applyButtonAction(action: @escaping () -> Void) {
        let actionHandler = UIAction { _ in
            action() // 클로저 호출
        }
        
        self.addAction(actionHandler, for: .touchUpInside)
    }
}
