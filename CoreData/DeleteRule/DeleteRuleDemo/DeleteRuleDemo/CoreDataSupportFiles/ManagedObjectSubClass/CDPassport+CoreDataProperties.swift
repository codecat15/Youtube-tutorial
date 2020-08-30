//
//  CDPassport+CoreDataProperties.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/28/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//
//

import Foundation
import CoreData


extension CDPassport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPassport> {
        return NSFetchRequest<CDPassport>(entityName: "CDPassport")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var passportNumber: String?
    @NSManaged public var placeOfIssue: String?
    @NSManaged public var toEmployee: CDEmployee?

}
