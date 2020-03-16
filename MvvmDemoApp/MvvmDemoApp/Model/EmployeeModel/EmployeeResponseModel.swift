//
//  EmployeeResponseModel.swift
//  MvvmDemoApp
//
//  Created by CodeCat15 on 3/14/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct EmployeeModel: Decodable {
    let id: Int
    let name, role, joiningDate: String
    let depID, salary: Int
    let workPhone: String

    enum CodingKeys: String, CodingKey {
        case id, name, role
        case joiningDate = "joining_date"
        case depID = "dep_id"
        case salary, workPhone
    }
}

typealias Employee = [EmployeeModel]
