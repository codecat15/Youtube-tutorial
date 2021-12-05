//
//  EmployeeViewModel.swift
//  AsyncAwaitDemo
//
//  Created by CodeCat15 on 11/25/21.
//

import Foundation

struct EmployeeViewModel
{
    private let authResource = AuthResource()
    private let employeeResource = EmployeeResource()

    func getPayroll() async throws -> [EmployeePayroll]? {

        do {

            let authResponse = try await authResource.getToken()
            return try await employeeResource.getPayroll(token: authResponse.token)

        } catch let serviceError {
            throw serviceError
        }

        //        authResource.getToken { authResponse in
        //
        //            guard authResponse != nil && authResponse?.token.isEmpty == false else {
        //                return completionHandler(nil)
        //            }
        //
        //            employeeResource.getPayroll(token: authResponse!.token) { payrollResponse in
        //                completionHandler(payrollResponse)
        //            }
        //        }
    }
}
