//
//  CDEmployee+CoreDataProperties.swift
//  FCDemo
//
//  Created by CodeCat15 on 8/15/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}
