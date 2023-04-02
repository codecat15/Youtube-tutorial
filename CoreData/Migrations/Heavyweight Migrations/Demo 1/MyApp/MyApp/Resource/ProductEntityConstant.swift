//
//  ProductEntityConstant.swift
//  MyApp
//
//  Created by CodeCat15 on 3/27/23.
//

/* Dev Notes: A migration runs only once so adding an enum can be bit of an overkill because once the migration completes this enum will add no value in the source code.
 
    You can avoid the enum but make sure that there are no spelling mistakes in the attribute names.
 
 */

/// The ProductEntityConstant holds the attribute name of the product entity
enum ProductEntityConstant {
    static let id = "id"
    static let name = "name"
    static let manufactureDate = "manufactureDate"
    static let expiryDate = "expiryDate"
    static let entityName = "ProductEntity"
    static let price = "price"
}
