//
//  Heroes.swift
//  lazyLoadingDemo
//
//  Created by CodeCat15 on 7/24/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct AnimalResponse: Decodable {
    let errorMessage: String
    let animals: [Animal]

    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

// MARK: - Datum
struct Animal: Decodable {
    let name, image: String
}
