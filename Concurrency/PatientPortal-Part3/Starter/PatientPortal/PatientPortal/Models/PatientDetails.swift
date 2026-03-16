//
//  PatientDetails.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import Foundation

// MARK: - Top-level response (Patient Detail)
struct PatientDetail: Decodable {
    let id: Int
    let mrn: String
    let fullName: String
    let age: Int
    let sex: String
    let ward: Ward
    let treatingDoctor: Doctor
    let conditions: [String]
    let symptoms: [String]
    let medications: [Medication]
    let lastUpdatedUtc: Date
}

// MARK: - Ward
struct Ward: Decodable {
    let name: String
    let number: String
    let bed: String
}

// MARK: - Doctor
struct Doctor: Decodable {
    let name: String
    let specialty: String
}

// MARK: - Medication
struct Medication: Decodable, Identifiable {
    let name: String
    let dose: String
    let frequency: String

    // Convenience ID for table diffing if needed
    var id: String { "\(name)-\(dose)-\(frequency)" }
}
