//
//  EmployeeResource.swift
//  AsyncAwaitDemo
//
//  Created by CodeCat15 on 11/25/21.
//

import Foundation

struct EmployeeResource {

    func getPayroll(token: String) async throws -> [EmployeePayroll] {

        var urlRequest = URLRequest(url: Service.payroll)
        urlRequest.httpMethod = "post"

        // attaching token to the body
        urlRequest.httpBody = createPayrollHttpBody(serviceToken: token)
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        do {
            let serviceResponse = try await HttpUtility.shared.performOperation(request: urlRequest, response: PayrollResponse.self)
            guard let empPayroll = serviceResponse.data else {
                    return []
            }
            return empPayroll
        } catch let serviceError {
            throw serviceError
        }
    }
    
    private func createPayrollHttpBody(serviceToken: String) -> Data? {
        let payrollBody = PayrollBody(token: serviceToken)
        do {
            return try JSONEncoder().encode(payrollBody)
        } catch  {
            debugPrint("error while encoding to data")
            return nil
        }
    }
}
