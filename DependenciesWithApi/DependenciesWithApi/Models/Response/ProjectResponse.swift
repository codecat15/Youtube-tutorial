//
//  AnimalResponse.swift
//  DependenciesWithApi
//
//  Created by CodeCat15 on 3/26/21.
//

import Foundation

struct Project: Decodable {
    let id: Int
    let name, description: String
    let isActive: Bool
    let startDate: Date
    let endDate: Date?

    enum CodingKeys: String, CodingKey {
        case id
        case name,description
        case isActive, startDate, endDate
    }
}
