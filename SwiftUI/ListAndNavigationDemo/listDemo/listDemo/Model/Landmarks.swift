//
//  Landmarks.swift
//  listDemo
//
//  Created by CodeCat15 on 5/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct Landmark : Decodable
{
    let landmarkId : Int
    let name, photo, description: String
}

struct City : Decodable
{
    let cityId: Int
    let name: String
    let landmarks: [Landmark]
}
