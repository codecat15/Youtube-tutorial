//
//  PatientRepository.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import Foundation

protocol PatientRepositoryProtocol {
    
    func getPatients(request: PatientRequest,
                     completionHandler: @escaping(PagedPatientsResponse?)-> Void)
    
    func getPatientDetails(patientId: Int,
                           completionHandler: @escaping(PatientDetail?)-> Void)
    
    func searchPatient(name: String, completionHandler: @escaping([PatientRecord]?)-> Void)
}

// MARK: - PatientRepository

final class PatientRepository: PatientRepositoryProtocol {

    private let http: HttpUtilityProtocol
    private let requestBuilder: PatientRequestBuilder

    // MARK: - initialization
    init(http: HttpUtilityProtocol, requestBuilder: PatientRequestBuilder) {
        self.http = http
        self.requestBuilder = requestBuilder
    }
    
    static var defaultRepository: PatientRepositoryProtocol {
        let httpUtility: HttpUtilityProtocol = HttpUtility()
        let requestBuilder: PatientRequestBuilder = PatientRequestBuilder()
        return PatientRepository(http: httpUtility, requestBuilder: requestBuilder)
    }
    
    // MARK: - Get Patients
    func getPatients(request: PatientRequest,
                     completionHandler: @escaping (PagedPatientsResponse?) -> Void) {
        
        let getPatientUrlRequest = self.requestBuilder.makeGetPatientsRequest(take: request.take, skip: request.skip)
        guard let patientUrlRequest = getPatientUrlRequest else { return }
        
        self.http.execute(request: patientUrlRequest) { (result: Result<PagedPatientsResponse?, HttpError>?) in
            
            guard let result else {
                // result was nil
                completionHandler(nil)
                return
            }
            switch result {
            case .success(let response):
                completionHandler(response)
            case .failure:
                // log error here
                print("PatientRepository: getPatients => error")
                completionHandler(nil)
            }
        }
    }
    
    // MARK: - PatientDetails
    func getPatientDetails(patientId: Int, completionHandler: @escaping (PatientDetail?) -> Void) {
        
        let getPatientDetailRequest = self.requestBuilder.makeGetPatientDetailsRequest(patientId: patientId)
        guard let patientDetailUrlRequest = getPatientDetailRequest else { return }
        
        self.http.execute(request: patientDetailUrlRequest) { (result: Result<PatientDetail?, HttpError>?) in
            
            guard let result else {
                // result was nil
                completionHandler(nil)
                return
            }
            switch result {
            case .success(let response):
                completionHandler(response)
            case .failure:
                // log error here
                print("PatientRepository: getPatientDetails => error")
                completionHandler(nil)
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
