//
//  CDEmployeeExtension.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

extension CDEmployee
{
    func convertToEmployee() -> Employee {
           return Employee(_id: (self.id)!, _name: self.name!, _email: self.email!, _profilePicture: self.profilePicture!, _passport: self.toPassport?.convertToPassport())
         }
}
