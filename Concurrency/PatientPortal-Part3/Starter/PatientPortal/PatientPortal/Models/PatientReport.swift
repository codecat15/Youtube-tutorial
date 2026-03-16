//
//  PatientReport.swift
//  PatientPortal
//
//  Created by CodeCat15 on 2/4/26.
//

import Foundation

// MARK: - PatientReport
struct PatientReport: Decodable, Identifiable {
    let id: Int
    let fullName: String
    let reports: [Report]
}

// MARK: - Report
struct Report: Decodable {
    let reportId, type: String
    let dateUtc: Date
    let url: String
}
