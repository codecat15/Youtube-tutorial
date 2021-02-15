//
//  APiResource.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import Foundation

struct ApiResource {
    static let login  = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")
    static let department = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Employee/GetEmployee?")
}
