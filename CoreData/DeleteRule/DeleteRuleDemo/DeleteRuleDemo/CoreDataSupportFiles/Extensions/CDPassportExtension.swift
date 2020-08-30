//
//  CDPassportExtension.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

extension CDPassport
{
    func convertToPassport() -> Passport? {
        return Passport(_id: self.id!, _passportNumber: self.passportNumber!, _placeOfIssue: self.placeOfIssue!, _name: self.toEmployee?.name)
    }
}
