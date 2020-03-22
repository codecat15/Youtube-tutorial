//
//  EmployeeViewModel.swift
//  MvvmDemoApp
//
//  Created by CodeCat15 on 3/17/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct EmployeeViewModel
{
    func getEmployeesByDepartment(departmentIndex: Int, completion: @escaping(_ result: EmployeeResponse?)-> Void)
    {
        let userId = UserDefaultUtility().getUserId()

        let employeeRequest = EmployeeRequest(userId: userId, department: DepartmentPropertyWrapper(_index: "\(departmentIndex)"))

        let employeeResource = EmployeeResource()

        employeeResource.getEmployeesByDepartment(employeeRequest: employeeRequest) { (employeeApiResponse) in

            _ = completion(employeeApiResponse)

        }
    }
}
