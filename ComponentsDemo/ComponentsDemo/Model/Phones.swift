//
//  SmartPhoneResponse.swift
//  MyProject
//
//  Created by CodeCat15 on 5/28/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct PhoneResponse : Decodable {

    let errorMessage: String?
    let data : [Phones]?

    enum CodingKeys: String, CodingKey
    {
        case errorMessage = "errorMessage"
        case data = "data"
    }
}

struct Phones : Decodable
{
    let name, operatingSystem,manufacturer, color : String
}
