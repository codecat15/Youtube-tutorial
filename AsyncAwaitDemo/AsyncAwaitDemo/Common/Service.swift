//
//  Service.swift
//  AsyncAwaitDemo
//
//  Created by CodeCat15 on 11/15/21.
//

import Foundation

struct Service {
    static let token: URL = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Employee/GetToken")!
    static let payroll: URL = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Employee/GetEmployeePayroll")!
}
