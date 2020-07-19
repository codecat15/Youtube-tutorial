//
//  Customer.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/17/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

class Person
{
    let id: UUID
    let name: String
    var vehicles: [Vehicle]?

    init(_id: UUID, _name: String, _vehicle: [Vehicle]? = nil)
    {
        self.id = _id
        self.name = _name
        self.vehicles = _vehicle
    }
}
