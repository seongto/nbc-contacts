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
    
    
    // 저장하는 기능
    func createNewContact(name: String, mobile: String, pokemon: Pokemon) -> Void {
        
    }
    
    // 불러오는 기능
    // 수정하는 기능
    // 삭제하는 기능
    // 소프트삭제하는 기능
}
