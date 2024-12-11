//
//  Contact+CoreDataClass.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/12/24.
//
//

import Foundation
import CoreData

@objc(Contact)
public class Contact: TimeStamp {
    /// CREATE - 새로운 Contact 생성
    /// - Parameters:
    ///   - context: NSManagedObjectContext (필수)
    ///   - name: String - 이름
    ///   - mobile: String - 전화번호
    ///   - pokemon: coreData에 저장된 Pokemon 객체
    /// - Returns: 생성된 Contact 객체
    public static func insert(in context: NSManagedObjectContext, name: String, mobile: String, pokemon: Pokemon) -> Contact? {
        let newContact = Contact(context: context)
        
        newContact.name = name
        newContact.mobile = phone
        newContact.pokemon = pokemon
        newContact.createdAt = Date()
        newContact.updatedAt = Date()
        newContact.deletedAt = nil
        
        do {
            try context.save()
            print("생성 완료: \(name)")
            return newContact
        } catch {
            print("Contact Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// 🔥 READ - 모든 Contact 조회
    /// - Parameter context: NSManagedObjectContext
    /// - Returns: 모든 Contact 목록
    public static func fetchAll(in context: NSManagedObjectContext) -> [Contact] {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do {
            let contacts = try context.fetch(request)
            print("✅ 총 \(contacts.count)개의 Contact를 불러왔습니다.")
            return contacts
        } catch {
            print("❌ READ 에러: \(error.localizedDescription)")
            return []
        }
    }
    
    /// 🔥 READ - 특정 조건의 Contact 조회
    /// - Parameters:
    ///   - context: NSManagedObjectContext
    ///   - predicate: NSPredicate - 조건
    /// - Returns: 조건에 맞는 Contact 목록
    public static func fetchWithPredicate(in context: NSManagedObjectContext, predicate: NSPredicate) -> [Contact] {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        request.predicate = predicate
        
        do {
            let contacts = try context.fetch(request)
            print("✅ 조건에 맞는 \(contacts.count)개의 Contact를 불러왔습니다.")
            return contacts
        } catch {
            print("❌ READ 에러: \(error.localizedDescription)")
            return []
        }
    }
    
    /// 🔥 UPDATE - Contact 정보 업데이트
    /// - Parameters:
    ///   - context: NSManagedObjectContext
    ///   - name: String - 새로운 이름
    ///   - phone: String - 새로운 전화번호
    ///   - email: String - 새로운 이메일
    /// - Returns: 성공 여부 (true/false)
    public func update(in context: NSManagedObjectContext, name: String, phone: String, email: String) -> Bool {
        self.name = name
        self.mobile = phone
        self.email = email
        self.updatedAt = Date()
        
        do {
            try context.save()
            print("✅ UPDATE 성공: \(name)")
            return true
        } catch {
            print("❌ UPDATE 에러: \(error.localizedDescription)")
            return false
        }
    }
    
    /// 🔥 DELETE - Contact 삭제
    /// - Parameter context: NSManagedObjectContext
    /// - Returns: 성공 여부 (true/false)
    public func delete(in context: NSManagedObjectContext) -> Bool {
        context.delete(self)
        
        do {
            try context.save()
            print("✅ DELETE 성공")
            return true
        } catch {
            print("❌ DELETE 에러: \(error.localizedDescription)")
            return false
        }
    }
}
