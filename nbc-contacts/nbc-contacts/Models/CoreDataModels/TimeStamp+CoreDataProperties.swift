//
//  TimeStamp+CoreDataProperties.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/12/24.
//
//

import Foundation
import CoreData


extension TimeStamp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeStamp> {
        return NSFetchRequest<TimeStamp>(entityName: "TimeStamp")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var deletedAt: Date?
    @NSManaged public var updatedAt: Date?

}

extension TimeStamp : Identifiable {

}
