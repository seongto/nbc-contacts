//
//  TableCellDelegate.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/12/24.
//

import Foundation

protocol ContentViewDelegate: AnyObject {

    /// 사용자가 테이블뷰의 아이템을 눌렀을 때 뷰컨트롤러를 통해 coordinator의 메소드를 실행.
    func tapCellBridge(with contact: Contact)
}
