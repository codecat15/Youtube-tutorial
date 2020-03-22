//
//  EmployeeResponseModel.swift
//  MvvmDemoApp
//
//  Created by CodeCat15 on 3/14/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct EmployeeResponse : Decodable
{
    let errorMessage: String?
    let data: [Employee]?
}

struct Employee: Decodable {
    let name, email, id: String
    let joining: String

    enum CodingKeys: String, CodingKey {
        case name, email, id, joining
    }
}
