//
//  ProductMigrationPolicy.swift
//  MyApp
//
//  Created by CodeCat15 on 3/26/23.
//

import Foundation
import CoreData

/**
 Hey there,👋
 
 I hope the session was helpful in explaining how heavyweight migration works.
 
 In the second demo we will explore a complex usecase showing how bad database design can impact the project and use heavyweight migration to make our design right.
 
 If you have any questions, please feel free to ask them as comments or ping me on iOS Cafe.
 
 I will be happy to respond to them.
 
 If the content that you saw was helpful, please support the channel by subscribing, and sharing it with your iOS group on whatsapp, slack, linkedin etc.
 
 Regards,
 Ravi
 
 */

// Dev Notes: This is a classic example of how core data framework utilizes Key-Value-Coding i.e. KVC.

/// This is the custom migration policy file used for migrating from V1 to V2 for ProductEntity
class ProductMigrationPolicy : NSEntityMigrationPolicy {
    
    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        
        if(sInstance.entity.name == ProductEntityConstant.entityName) {
            
            let id = sInstance.value(forKey: ProductEntityConstant.id) as? UUID
            let name = sInstance.value(forKey: ProductEntityConstant.name) as? String
            let manufactureDate = sInstance.value(forKey: ProductEntityConstant.manufactureDate) as? String
            let expiryDate = sInstance.value(forKey: ProductEntityConstant.expiryDate) as? String
            let price = sInstance.value(forKey: ProductEntityConstant.price) as? String
            
            let newProductEntity = NSEntityDescription.insertNewObject(forEntityName: "ProductEntity", into: manager.destinationContext)
            
            newProductEntity.setValue(id, forKey: ProductEntityConstant.id)
            newProductEntity.setValue(name, forKey: ProductEntityConstant.name)
            newProductEntity.setValue(manufactureDate?.toDate(), forKey: ProductEntityConstant.manufactureDate)
            newProductEntity.setValue(expiryDate?.toDate(), forKey: ProductEntityConstant.expiryDate)
            newProductEntity.setValue(price?.toDecimal(), forKey: ProductEntityConstant.price)
        }
    }
}
