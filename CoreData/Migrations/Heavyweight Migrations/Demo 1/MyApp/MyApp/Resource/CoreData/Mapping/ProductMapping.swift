//
//  ProductMapping.swift
//  MyApp
//
//  Created by CodeCat15 on 3/25/23.
//

import Foundation

protocol ProductMapping {
    func toProduct(entity: ProductEntity) -> Product
    func toProducts(entities: [ProductEntity]) -> [Product]
}

class ProductMappingImplementation: ProductMapping {
    
    /// Transforms the single product entity into the client domain contract
    /// - Parameter entity: A non-optional product domain contract
    /// - Returns: A Product client contract
    func toProduct(entity: ProductEntity) -> Product {
        return Product(id: entity.id,
                       name: entity.name ?? String.empty(),
                       manufactureDate: entity.manufactureDate,
                       expiryDate: entity.expiryDate,
                       price: entity.price as? Decimal)
    }
    
    
    /// Transforms an array of product entity into the client domain contract
    /// - Parameter entities: A non-optional collection of product domain contract
    /// - Returns: A collection of Product client contract
    func toProducts(entities: [ProductEntity]) -> [Product] {
        return entities.map({toProduct(entity: $0)})
    }
}

