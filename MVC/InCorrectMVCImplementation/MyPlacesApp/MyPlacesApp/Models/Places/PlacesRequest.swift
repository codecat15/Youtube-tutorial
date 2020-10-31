//
//  PlacesRequest.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import Foundation

struct PlacesRequest : Encodable
{
    let radius: Double
    let type: String
    let key: String
    let location: String
}
