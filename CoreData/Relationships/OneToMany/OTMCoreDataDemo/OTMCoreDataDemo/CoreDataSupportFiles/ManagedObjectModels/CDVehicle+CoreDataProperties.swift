//
//  CDVehicle+CoreDataProperties.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/18/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//
//

import Foundation
import CoreData


extension CDVehicle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDVehicle> {
        return NSFetchRequest<CDVehicle>(entityName: "CDVehicle")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var toPerson: CDPerson?

}
