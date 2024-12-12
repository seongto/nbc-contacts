//
//  ContactManager.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import CoreData


class ContactManager {
    
    private var selectedContact: Contact?
    private var container: NSPersistentContainer
    private var context: NSManagedObjectContext { container.viewContext }
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer

    }
    
    
    /// 새로운 연락처를 저장하는 기능
    func createNewContact(name: String, mobile: String, pokemon: Pokemon) -> Void {
        guard validateTextData(name: name, mobile: mobile) else {
            return
        }
        
        guard Contact.insert(in: context, name: name, mobile: mobile, pokemon: pokemon) != nil else {
            print("Error creating new contact")
            return
        }
    }
    
    /// 선택된 연락처 업데이트
    func updateContact(name: String, mobile: String, pokemon: Pokemon) -> Void {
        guard validateTextData(name: name, mobile: mobile) else {
            return
        }
        
        guard selectedContact?.update(in: context, name: name, mobile: mobile, pokemon: pokemon) != nil else {
            print("Error updating contact of \(name)")
            return
        }
        
        AppHelpers.showAlert(title: "수정 완료", message: "\(name) 연락처가 수정되었습니다.")
    }
    
    /// 불러오는 기능
    func getContactAll() -> [Contact] {
        let contacts = Contact.selectAll(in: context)
        
        return contacts.sorted { $0.name ?? "" < $1.name ?? "" }
    }
    
    /// 선택된 연락처를 가져오기
    func getSelectedContact() -> Contact? {
        return selectedContact
    }
    
    /// 특정 연락처를 선택한 상태로 두기
    func selectContact(contact: Contact) {
        selectedContact = contact
    }
}


// MARK: - 예외처리

extension ContactManager {
    private func validateTextData(name: String, mobile: String) -> Bool {
        guard name.isEmpty == false && name.count >= 2 else {
            AppHelpers.showAlert(title: "이름이 너무 짧아요!", message: "이름을 최소 2글자 이상 적어주세요. 최대 10글자.")
            return false
        }
        
        guard mobile.isEmpty == false && mobile.count >= 10 else {
            AppHelpers.showAlert(title: "이거 번호 맞나요?", message: "제대로 된 번호를 적어주세요.")
            return false
        }
        
        return true
    }
}
