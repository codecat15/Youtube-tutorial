//
//  ProductEntity+CoreDataProperties.swift
//  MyApp
//
//  Created by CodeCat15 on 3/26/23.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var expiryDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var manufactureDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var price: NSDecimalNumber?

}

extension ProductEntity : Identifiable {

}
