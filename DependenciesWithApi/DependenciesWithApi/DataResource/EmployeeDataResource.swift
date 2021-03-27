//
//  EmployeeDataResource.swift
//  DependenciesWithApi
//
//  Created by CodeCat15 on 3/26/21.
//

import Foundation

// MARK: - Employee
struct EmployeeDataResource
{
    func getEmployee(handler:@escaping(_ result: [EmployeeData]?)-> Void)
    {
        debugPrint("inside the get employee function")

        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Employee/GetEmployee?Department=mobile&UserId=15")!)
        urlRequest.httpMethod = "get"
        debugPrint("going to call the http utility for employee request")

        HttpUtility.shared.getData(request: urlRequest, response: EmployeeResponse.self) { (result) in
            if(result != nil) {
                debugPrint("got the emloyee response from api")
                handler(result?.data)
            }
        }
    }
}
