//
//  ProductRepository.swift
//  MyApp
//
//  Created by CodeCat15 on 3/25/23.
//

protocol ProductRepository {
    func fetchProducts() -> [Product]?
    func populateTestRecordsForDemo()
}

class ProductRepositoryImplementation : ProductRepository {
    
    // Dev Notes: Please use constructor injection, this is hidden dependency
    private let productMapping: ProductMapping = ProductMappingImplementation()
    
    /// Fetch all product
    /// - Returns: Returns a collection of the Product client contract else nil
    func fetchProducts() -> [Product]? {
        let products = PersistentStorage.shared.fetchContext(managedObject: ProductEntity.self)
        return products == nil ? nil : productMapping.toProducts(entities: products!)
    }
    
    /// This method is used to populate the database on application load with test records
    func populateTestRecordsForDemo() {
//        let products = [
//            Product(id: UUID(), name: "Apple", manufactureDate: "10/03/2023",
//                    expiryDate: "22/07/2023", price: "100"),
//            Product(id: UUID(), name: "Baking Soda", manufactureDate: "3/02/2023",
//                    expiryDate: "19/10/2023", price: "10"),
//            Product(id: UUID(), name: "Cola", manufactureDate: "10/03/2023",
//                    expiryDate: "22/07/2023", price: "30"),
//            Product(id: UUID(), name: "Protein Bar", manufactureDate: "3/02/2023",
//                    expiryDate: "19/10/2023", price: "500")
//        ]
//
//        products.forEach { product in
//            let productEntity = ProductEntity(context: PersistentStorage.shared.managedObjectContext)
//            productEntity.id = product.id
//            productEntity.name = product.name
//            productEntity.manufactureDate = product.manufactureDate
//            productEntity.expiryDate = product.expiryDate
//            productEntity.price = product.price
//        }
//
//        PersistentStorage.shared.saveContext()
    }
}
