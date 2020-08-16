//
//  EmployeeManager.swift
//  FCDemo
//
//  Created by CodeCat15 on 8/15/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct EmployeeManager
{
    private let _employeeDataRepository: EmployeeDataRepository = EmployeeDataRepository()

    func createEmployee(record: Employee)
    {
        _employeeDataRepository.create(record: record)
    }
    
    func getAllRecords() -> [Employee]?
    {
        return _employeeDataRepository.getAll()
    }
}
