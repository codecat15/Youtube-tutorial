//
//  AnimalResponse.swift
//  LazyLoadingDemo
//
//  Created by CodeCat15 on 7/4/21.
//

import Foundation

struct AnimalResponse : Decodable {
    let errorMessage : String?
    let data: [Animal]
}

struct Animal : Decodable, Identifiable {
    var id = UUID()
    let name, image: String

    enum CodingKeys: String, CodingKey{
        case name
        case image
    }
}
