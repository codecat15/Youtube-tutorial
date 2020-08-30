//
//  Passport.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

class Passport
{
    let id: UUID
    let passportNumber, placeOfIssue, name: String?

    init(_id: UUID, _passportNumber: String?, _placeOfIssue: String?, _name: String? = nil)
    {
        self.id = _id
        self.name = _name
        self.placeOfIssue = _placeOfIssue
        self.passportNumber = _passportNumber
    }
}
