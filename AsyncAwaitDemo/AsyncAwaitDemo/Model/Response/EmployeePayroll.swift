//
//  EmployeePayroll.swift
//  AsyncAwaitDemo
//
//  Created by CodeCat15 on 11/25/21.
//

import Foundation

struct PayrollResponse: Decodable {
    let errorMessage: String?
    let data: [EmployeePayroll]?
}

// MARK: - Datum
struct EmployeePayroll: Decodable {

    let employeeId: Int
    let name, countryCode, currencyCode: String
    let weeklyRate: Int

    enum CodingKeys: String, CodingKey {
        case employeeId
        case name, countryCode, currencyCode
        case weeklyRate
    }
}
