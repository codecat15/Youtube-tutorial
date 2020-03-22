//
//  EmployeeDataResource.swift
//  MvvmDemoApp
//
//  Created by CodeCat15 on 3/17/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct EmployeeResource
{
    func getEmployeesByDepartment(employeeRequest: EmployeeRequest, completion: @escaping(_ result : EmployeeResponse?) -> Void)
    {
        let httpUtility = HttpUtility()

        let employeeEndpoint = "\(ApiEndpoints.employees)?Department=\(employeeRequest.department)&UserId=\(employeeRequest.userId)"

        let requestUrl = URL(string:employeeEndpoint)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: EmployeeResponse.self) { (employeeApiResponse) in

            _ = completion(employeeApiResponse)
        }
    }
}
