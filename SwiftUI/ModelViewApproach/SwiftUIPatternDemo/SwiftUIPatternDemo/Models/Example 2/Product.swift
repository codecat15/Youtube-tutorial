//
//  Product.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import SwiftUI

class Product : ObservableObject {
    @Published var name: String = String()
    @Published var price: Double = 0
    @Published var description: String = String()
    
    func getAllProducts() -> Array<Product>? {
        // api call to fetch the data and return product collection
        return nil
    }
}
