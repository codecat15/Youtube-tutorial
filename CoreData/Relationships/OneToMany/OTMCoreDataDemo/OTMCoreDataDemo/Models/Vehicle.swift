//
//  Account.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/17/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

class Vehicle
{
    let id: UUID
    let name, type: String
    let ownerName: String?

    init(_id: UUID, _name: String, _type: String, _ownerName: String? = nil)
    {
        self.id = _id
        self.name = _name
        self.type = _type
        self.ownerName = _ownerName
    }
}
