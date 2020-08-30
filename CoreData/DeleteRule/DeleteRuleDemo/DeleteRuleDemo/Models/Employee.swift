//
//  Employee.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

class Employee
{
    let id: UUID
    let name, email: String
    var passport: Passport?
    
    init(_id: UUID, _name: String, _email: String, _passport: Passport? = nil) {

        self.id = _id
        self.name = _name
        self.email = _email
        self.passport = _passport
    }
}
