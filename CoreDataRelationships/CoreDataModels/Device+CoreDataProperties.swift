//
//  Device+CoreDataProperties.swift
//  CoreDataRelationships
//
//  Created by Gabriel Rosa on 9/11/20.
//  Copyright © 2020 Gabriel Rosa. All rights reserved.
//
//

import Foundation
import CoreData


extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device")
    }

    @NSManaged public var name: String?
    @NSManaged public var owner: Person?

}
