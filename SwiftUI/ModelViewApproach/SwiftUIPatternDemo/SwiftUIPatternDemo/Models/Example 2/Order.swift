//
//  Order.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import SwiftUI

class Order : ObservableObject {
    @Published var products: [Product]?
    @Published var totalPrice: Double = 0
    
    func calculateTotalProductPrice() {
        let product = products?.first
        _ = product?.getAllProducts()
    }
}
