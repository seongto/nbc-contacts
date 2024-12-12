//
//  HomeContentView.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import SnapKit

final class HomeContentView: UIView {
    
    let tableView = UITableView()
    weak var delegate: ContentViewDelegate?
    
    private var contactList: [Contact] = []
    
    init() {
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
        self.backgroundColor = Colors.bg
        self.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.applyHomeTableStyle()
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.id)
        
        // 데이터소스와 델리게이트 연결
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}


// MARK: - 테이블뷰 관리

extension HomeContentView {
    func refreshContacts(data: [Contact]) {
        self.contactList = data
        tableView.reloadData()
    }
}


extension HomeContentView: UITableViewDelegate {
    /// 셀의 높이를 반환.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.cellForRow(at: indexPath) is ContactTableViewCell else { return }
        
        let contact = contactList[indexPath.row]
        
        delegate?.tapCellBridge(with: contact)
    }
}


extension HomeContentView: UITableViewDataSource {
    /// 셀의 개수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    /// 각 행에 대해 셀을 구성하고 반환합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: ContactTableViewCell.id, for: indexPath) as? ContactTableViewCell else {
            fatalError("ContactTableViewCell을 dequeue하는데 실패했습니다.")
        }
        
        let contact = contactList[indexPath.row]
        cell.config(contact: contact)
        
        return cell
    }
}
