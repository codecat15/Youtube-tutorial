//
//  ProductViewModel.swift
//  MyApp
//
//  Created by CodeCat15 on 3/25/23.
//

protocol ProductViewModel {
    func fetchProducts() -> [Product]?
    func populateTestRecordsForDemo()
}

class ProductViewModelImplementation: ProductViewModel {
    
    // Dev notes: This is a hidden dependency, please use constructor injection.
    private let productRepository: ProductRepository = ProductRepositoryImplementation()
    
    /// Fetch all the products from database
    /// - Returns: A collection of the product client contract else nil
    func fetchProducts() -> [Product]? {
        return productRepository.fetchProducts()
    }
    
    /// This method is used to populate the database on application load with test records
    func populateTestRecordsForDemo() {
        productRepository.populateTestRecordsForDemo()
    }
}
