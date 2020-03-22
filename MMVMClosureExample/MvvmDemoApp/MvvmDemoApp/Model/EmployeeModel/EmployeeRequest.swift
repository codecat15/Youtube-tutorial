//
//  EmployeeRequest.swift
//  MvvmDemoApp
//
//  Created by CodeCat15 on 3/17/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

@propertyWrapper
struct DepartmentPropertyWrapper {
    private var _value: String
    var wrappedValue: String
    {
        get
        {
            return _value == "0" ? "mobile" : "web"
        }
        set
        {
            _value = newValue
        }
    }

    init(_index: String) {
        _value = _index
    }
}

struct EmployeeRequest
{
    var userId: Int
   @DepartmentPropertyWrapper var department: String
}
