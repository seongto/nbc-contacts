//
//  CALayer+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/12/24.
//

import UIKit


extension CALayer {
    /// 각종 UI에 외곽선을 원하는 방향으로만 설정하는 메소드
    /// - Parameters:
    ///   - arr_edge: 외곽선을 두고 싶은 방향
    ///   - color: 외곽선 색상
    ///   - width: 외곽선 두께
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
