//
//  AnimalResponse.swift
//  DWIDemo
//
//  Created by CodeCat15 on 1/28/21.
//

import Foundation

struct AnimalResponse: Decodable {
    let errorMessage: String
    let animals: [Animal]?

    enum CodingKeys : String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

// MARK: - Datum
struct Animal: Decodable {
    let name: String
    let image: String
}
