//
//  Patient.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import Foundation

// MARK: - Patient Record for UI

struct PatientRecord: Decodable, Identifiable {
    let id: Int
    let fullName: String
    let wardNumber: String
    let bed: String
    let doctorName: String
}

// MARK: - Top-level response

struct PagedPatientsResponse: Decodable {
    let pagination: Pagination
    let records: [PatientRecord]
}

// MARK: - Pagination

struct Pagination: Decodable {
    let pageNumber: Int
    let pageSize: Int
    let totalCount: Int
}

