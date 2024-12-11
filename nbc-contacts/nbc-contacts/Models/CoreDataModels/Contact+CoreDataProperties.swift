//
//  Contact+CoreDataProperties.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/12/24.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var mobile: String?
    @NSManaged public var name: String?
    @NSManaged public var category: Category?
    @NSManaged public var pokemon: Pokemon?
}
