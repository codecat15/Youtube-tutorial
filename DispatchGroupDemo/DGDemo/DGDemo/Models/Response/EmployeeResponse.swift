//
//  EmployeeResponse.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import Foundation

// MARK: - EmployeeResponse
struct EmployeeResponse: Decodable {
    let errorMessage: String?
    let data: [Employee]?
}

// MARK: - Employee
struct Employee: Decodable {
    let name, email, id, joining: String
}
