//
//  CDPassportExtension.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

extension CDPassport
{
    func convertToPassport() -> Passport? {
        return Passport(_id: (self.id)!, _passportId: self.passportId, _placeOfIssue: self.placeOfIssue, _name: self.toEmployee?.name)
    }
}
