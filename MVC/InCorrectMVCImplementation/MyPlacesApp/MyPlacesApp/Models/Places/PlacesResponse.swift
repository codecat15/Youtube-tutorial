//
//  Places.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import Foundation

struct PlacesResponse: Decodable{
    let htmlAttributions: [String]?
    let nextPageToken: String?
    let results: [Result]?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results, status
    }
}

struct Result: Decodable {
    
    let geometry: Geometry?
    let name: String?
    let rating: Double?
    let userRatingsTotal: Int?
    let vicinity: String?
    
    enum CodingKeys: String, CodingKey {
        case geometry, name
        case rating
        case userRatingsTotal = "user_ratings_total"
        case vicinity
    }
}

// MARK: - Geometry
struct Geometry: Decodable {
    let location: Location?
    let viewport: Viewport?
}

// MARK: - Location
struct Location: Decodable {
    let lat, lng: Double?
}

// MARK: - Viewport
struct Viewport: Decodable {
    let northeast, southwest: Location?
}
