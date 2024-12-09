//
//  ModalManager.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit


/// 전역으로 모달을 관리하기 위해 싱글턴 매니저로 구성.
/// ModalManager를 통해 전역에서 원하는 View를 GlobalModalViewController 에 추가하여 보여준다.
struct ModalManager {
    
    /// 전역 모달을 생성하고 표시합니다.
    static func createGlobalModal(_ content: UIView) -> GlobalModalViewController? {
        guard let topVC = AppHelpers.getTopViewController() else {
            return nil
        }
        
        let modalVC = GlobalModalViewController(target: content)
        modalVC.modalPresentationStyle = .overFullScreen
        modalVC.modalTransitionStyle = .crossDissolve
        
        // iOS 13 이상에서 모달 제스처를 비활성화
        if #available(iOS 13.0, *) {
            modalVC.isModalInPresentation = true
        }
        
        topVC.present(modalVC, animated: true, completion: nil)
        return modalVC
    }
}
