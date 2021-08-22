//
//  AnimalResponse.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//

import Foundation

struct AnimalResponse: Decodable {
    let errorMessage: String?
    let animals: [Animal]?

    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

struct Animal: Decodable {
    let name: String
    let image: URL
}
