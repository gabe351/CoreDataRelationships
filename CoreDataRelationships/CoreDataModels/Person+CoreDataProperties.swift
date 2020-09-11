//
//  Person+CoreDataProperties.swift
//  CoreDataRelationships
//
//  Created by Gabriel Rosa on 9/11/20.
//  Copyright © 2020 Gabriel Rosa. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var device: NSSet?

}

// MARK: Generated accessors for device
extension Person {

    @objc(addDeviceObject:)
    @NSManaged public func addToDevice(_ value: Device)

    @objc(removeDeviceObject:)
    @NSManaged public func removeFromDevice(_ value: Device)

    @objc(addDevice:)
    @NSManaged public func addToDevice(_ values: NSSet)

    @objc(removeDevice:)
    @NSManaged public func removeFromDevice(_ values: NSSet)

}
