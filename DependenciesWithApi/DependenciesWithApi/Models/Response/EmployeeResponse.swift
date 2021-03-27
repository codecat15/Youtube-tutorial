//
//  EmployeeResponse.swift
//  DependenciesWithApi
//
//  Created by CodeCat15 on 3/26/21.
//

import Foundation

// MARK: - EmployeeResponse
struct EmployeeResponse: Decodable {
    let errorMessage: String?
    let data: [EmployeeData]?
}

// MARK: - EmployeeData
struct EmployeeData: Decodable {
    let name, email, id,joining: String
}
