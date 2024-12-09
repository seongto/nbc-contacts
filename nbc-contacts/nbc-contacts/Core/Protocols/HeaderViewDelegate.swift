//
//  HeaderViewDelegate.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import Foundation

protocol HeaderViewDelegate: AnyObject {
    /// 사용자가 'Create' 버튼을 눌렀을 때 호출.
    func didTapCreateButton()
    
    /// 사용자가 'Back' 버튼을 눌렀을 때 호출.
    func didTapBackButton()
}
