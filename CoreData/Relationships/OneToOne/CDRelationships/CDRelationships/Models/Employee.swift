//
//  Employee.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

class Employee
{
    let id: UUID
    let name, email: String
    let profilePicture: Data
    var passport: Passport?

    init(_id: UUID, _name: String, _email: String, _profilePicture: Data,_passport: Passport? = nil) {

        self.id = _id
        self.name = _name
        self.email = _email
        self.passport = _passport
        self.profilePicture = _profilePicture
    }
}
