//
//  PatientRepository.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import Foundation

protocol PatientRepositoryProtocol {
    
    // func functionName(parameters) async -> returnType
    // func functionName(parameters) async throws -> returnType
    
    func getPatients(request: PatientRequest) async -> PagedPatientsResponse?
    
    func getPatientDetails(patientId: Int) async throws -> PatientDetail?
    
    func searchPatient(name: String, completionHandler: @escaping([PatientRecord]?)-> Void)
}

enum PatientRepositoryError : Error {
    case defaultError
}

// MARK: - PatientRepository

final class PatientRepository: PatientRepositoryProtocol {
    
    private let http: HttpUtilityProtocol
    private let requestBuilder: PatientUrlRequestBuilder

    // MARK: - initialization
    init(http: HttpUtilityProtocol, requestBuilder: PatientUrlRequestBuilder) {
        self.http = http
        self.requestBuilder = requestBuilder
    }
    
    static var defaultRepository: PatientRepositoryProtocol {
        let httpUtility: HttpUtilityProtocol = HttpUtility()
        let requestBuilder: PatientUrlRequestBuilder = PatientRequestBuilder()
        return PatientRepository(http: httpUtility, requestBuilder: requestBuilder)
    }
    
    // MARK: - Get Patients
    func getPatients(request: PatientRequest) async -> PagedPatientsResponse? {
        
        let getPatientUrlRequest = self.requestBuilder.makeGetPatientsRequest(take: request.take, skip: request.skip)
        guard let patientUrlRequest = getPatientUrlRequest else { return nil }
        
       return await withCheckedContinuation { continuation in
            self.http.execute(request: patientUrlRequest) { (result: Result<PagedPatientsResponse?, HttpError>?) in
                
                guard let result else {
                    // result was nil
                    continuation.resume(returning: nil)
                    return
                }
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure:
                    // log error here
                    print("PatientRepository: getPatients => error")
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    // MARK: - PatientDetails
    func getPatientDetails(patientId: Int) async throws -> PatientDetail? {
        
        let getPatientDetailRequest = self.requestBuilder.makeGetPatientDetailsRequest(patientId: patientId)
        guard let patientDetailUrlRequest = getPatientDetailRequest else { return nil }
        
        return try await withCheckedThrowingContinuation { continuation in
            
            self.http.execute(request: patientDetailUrlRequest) { (result: Result<PatientDetail?, HttpError>?) in
                
                guard let result else {
                    // result was nil
                    continuation.resume(throwing: PatientRepositoryError.defaultError)
                    return
                }
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure:
                    // log error here
                    print("PatientRepository: getPatientDetails => error")
                    continuation.resume(throwing: PatientRepositoryError.defaultError)
                }
            }
        }
        
        
    }
    
    func searchPatient(name: String, completionHandler: @escaping([PatientRecord]?)-> Void) {
        
        let patientSearchRequest = self.requestBuilder.makeSearchPatientByNameRequest(name: name)
        guard let patientSearchUrlRequest = patientSearchRequest else { return }
        
        self.http.execute(request: patientSearchUrlRequest) { (result: Result<[PatientRecord]?, HttpError>?) in
            
            guard let result else {
                // result was nil
                completionHandler([])
                return
            }
            switch result {
            case .success(let response):
                completionHandler(response)
            case .failure:
                // log error here
                print("PatientRepository: getPatientDetails => error")
                completionHandler([])
            }
        }
    }
}
