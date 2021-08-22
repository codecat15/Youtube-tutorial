//
//  CDAnimal+CoreDataProperties.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//
//

import Foundation
import CoreData


extension CDAnimal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAnimal> {
        return NSFetchRequest<CDAnimal>(entityName: "CDAnimal")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: URL?
    @NSManaged public var id: UUID?

}

extension CDAnimal : Identifiable {

}
