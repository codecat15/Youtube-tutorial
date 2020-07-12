//
//  Passport.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

class Passport
{
    let id: UUID
    let passportId, placeOfIssue, name: String?

    init(_id: UUID, _passportId: String?, _placeOfIssue: String?, _name: String? = nil)
    {
        self.id = _id
        self.name = _name
        self.placeOfIssue = _placeOfIssue
        self.passportId = _passportId
    }
}
