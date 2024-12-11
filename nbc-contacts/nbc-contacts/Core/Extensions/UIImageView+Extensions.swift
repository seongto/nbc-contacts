//
//  UIImageView+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import SnapKit

// MARK: - 스타일 관리

extension UIImageView {
    
    /// 연락처의 포켓몬 이미지의 스타일을 적용
    /// - Parameters:
    ///   - size: 이미지의 사이즈. CGFloat 타입
    ///   - mask: 이미지가 border 밖으로 나가는 것에 대한 허용 여부.
    func applyProfileImageStyle(size: CGFloat, mask: Bool = false) {
        
        if mask {
            self.layer.borderColor = Colors.gray2.cgColor
            self.layer.borderWidth = 1
        } else {
            self.layer.borderColor = nil
        }
        
        self.clipsToBounds = mask
        self.backgroundColor = Colors.white
        self.layer.cornerRadius = size / 2
        self.contentMode = .scaleAspectFill
        
        self.snp.makeConstraints { make in
            make.height.width.equalTo(size)
        }
    }
}

// MARK: - 각종 액션 관리

extension UIImageView {
    /// UIImageView의 사이즈를 변경
    /// - Parameter width: 변경하고자 하는 width값
    /// - Parameter height: 변경하고자 하는 height값
    func resized(width:Int = -1, height: Int = -1) {
        let current = self.frame.size
                
        self.snp.makeConstraints { make in
            make.height.equalTo(height < 0 ? current.height : CGFloat(height))
            make.width.equalTo(width < 0 ? current.width : CGFloat(width))
        }
    }
    
    /// URL로부터 이미지를 비동기적으로 다운로드하여 ImageView에 설정하는 메서드
    /// - Parameter urlString: 이미지의 URL 문자열
    func setImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            print("잘못된 URL: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("❌ 이미지 다운로드 실패: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("❌ 이미지 데이터를 디코딩할 수 없습니다.")
                return
            }
            
            DispatchQueue.main.async {
                self?.image = image // ✅ 메인 스레드에서 UI 업데이트
            }
        }.resume()
    }
}
