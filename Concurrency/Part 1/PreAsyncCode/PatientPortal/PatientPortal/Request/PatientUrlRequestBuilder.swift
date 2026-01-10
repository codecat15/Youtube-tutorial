//
//  PatientUrlRequestBuilder.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import Foundation

protocol PatientRequestBuilding {
    func makeGetPatientsRequest(take: Int, skip: Int) -> URLRequest?
    func makeGetPatientDetailsRequest(patientId: Int) -> URLRequest?
    func makeSearchPatientByNameRequest(name: String) -> URLRequest?
}

final class PatientRequestBuilder: PatientRequestBuilding {

    private let baseURL: URL

    init(baseURL: URL = URL(string: "https://api-dev-patient-portal.azurewebsites.net/api/")!) {
        self.baseURL = baseURL
    }

    func makeGetPatientsRequest(take: Int, skip: Int) -> URLRequest? {
        let endpoint = baseURL.appendingPathComponent("Patients")

        var components = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)
        components?.queryItems = [
            URLQueryItem(name: "Take", value: String(take)),
            URLQueryItem(name: "Skip", value: String(skip))
        ]

        guard let url = components?.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }

    func makeGetPatientDetailsRequest(patientId: Int) -> URLRequest? {
        let endpoint = baseURL.appendingPathComponent("Patients/PatientDetails")

        var components = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)
        components?.queryItems = [
            URLQueryItem(name: "id", value: String(patientId))
        ]

        guard let url = components?.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    func makeSearchPatientByNameRequest(name: String) -> URLRequest? {
        let endpoint = baseURL.appendingPathComponent("Patients/search")
        
        var components = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)
        components?.queryItems = [
            URLQueryItem(name: "Name", value: String(name))
        ]

        guard let url = components?.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
        
    }
}

