//
//  Pokemon+CoreDataProperties.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/12/24.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: Int16
    @NSManaged public var spriteBack: String?
    @NSManaged public var spriteFront: String?
    @NSManaged public var spriteShiny: String?
    @NSManaged public var contacts: NSSet?

}

// MARK: Generated accessors for contacts
extension Pokemon {

    @objc(addContactsObject:)
    @NSManaged public func addToContacts(_ value: Contact)

    @objc(removeContactsObject:)
    @NSManaged public func removeFromContacts(_ value: Contact)

    @objc(addContacts:)
    @NSManaged public func addToContacts(_ values: NSSet)

    @objc(removeContacts:)
    @NSManaged public func removeFromContacts(_ values: NSSet)

}
