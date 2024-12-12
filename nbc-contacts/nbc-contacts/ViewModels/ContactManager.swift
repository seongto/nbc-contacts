//
//  ContactManager.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import CoreData


class ContactManager {
    
    var container: NSPersistentContainer
    var context: NSManagedObjectContext { container.viewContext }
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer

    }
    
    
    // 새로운 연락처를 저장하는 기능
    func createNewContact(name: String, mobile: String, pokemon: Pokemon) -> Void {
        guard name.isEmpty == false && name.count >= 2 else {
            AppHelpers.showAlert(title: "이름이 너무 짧아요!", message: "이름을 최소 2글자 이상 적어주세요. 최대 10글자.")
            return
        }
        
        guard mobile.isEmpty == false && mobile.count >= 10 else {
            AppHelpers.showAlert(title: "이거 번호 맞나요?", message: "제대로 된 번호를 적어주세요.")
            return
        }
        
        guard let newContact = Contact.insert(in: context, name: name, mobile: mobile, pokemon: pokemon) else {
            
            print("Error creating new contact")
            return
        }
    }
    
    // 불러오는 기능
    func getContactAll() -> [Contact] {
        let contacts = Contact.selectAll(in: context)
        
        return contacts.sorted { $0.name ?? "" < $1.name ?? "" }
    }
}
