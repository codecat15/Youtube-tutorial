//
//  CDEmployeeExtensions.swift
//  FCDemo
//
//  Created by CodeCat15 on 8/15/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

extension CDEmployee
{
    func convertToEmployee() -> Employee
    {
        return Employee(id: self.id!, name: self.name!)
    }
}
