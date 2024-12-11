//
//  UIButton+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit

// MARK: - 버튼 스타일링

extension UIButton {
    
    func applyCreateButtonStyle() {
        var config = UIButton.Configuration.plain()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        
        config.image = UIImage(systemName: "plus", withConfiguration: imageConfig)
        config.buttonSize = .medium
        config.titleAlignment = .center
        
        self.configuration = config // config를 통해 설정한 내용 적용하기
    }
    
    func applyRequestPokemonButtonStyle() {
        var config = UIButton.Configuration.plain()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
        
        config.image = UIImage(systemName: "repeat", withConfiguration: imageConfig)
        config.buttonSize = .medium
        config.titleAlignment = .center
        config.baseForegroundColor = Colors.darkGray
        
        self.configuration = config
        
        self.backgroundColor = Colors.white
        self.layer.cornerRadius = 60
        self.layer.borderWidth = 20
        self.layer.borderColor = UIColor.darkGray.cgColor

        self.snp.makeConstraints { make in
            make.height.width.equalTo(120)
        }
    }
    
}


// MARK: - 버튼 액션 할당

extension UIButton {
    /// 부모로부터 액션을 할당받아 버튼의 터치 동작과 연결.
    /// - Parameter action: 비동기 동작을 수행하는 클로저
    func applyButtonAction(action: @escaping () async -> Void) {
        let actionHandler = UIAction { _ in
            Task {
                await action()
            }
        }
        
        self.addAction(actionHandler, for: .touchUpInside)
    }
}
