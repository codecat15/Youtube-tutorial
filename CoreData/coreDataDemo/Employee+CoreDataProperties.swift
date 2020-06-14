//
//  Employee+CoreDataProperties.swift
//  coreDataDemo
//
//  Created by CodeCat15 on 6/12/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?

}
