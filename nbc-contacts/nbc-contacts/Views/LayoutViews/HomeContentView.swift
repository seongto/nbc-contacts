//
//  HomeContentView.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit

final class HomeContentView: UIView {
    
    let tableView: UITableView
    
    init() {
        tableView = UITableView()
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - 구성요소 레이아웃 및 액션 매핑
extension HomeContentView {
    func setupUI() {
        self.addSubview(tableView)
        self.backgroundColor = Colors.yellow
        
        tableView.applyHomeTableStyle()
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
