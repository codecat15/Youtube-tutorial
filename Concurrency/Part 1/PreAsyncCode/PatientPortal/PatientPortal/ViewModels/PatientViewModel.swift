//
//  PatientViewModel.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import Foundation
import Combine

protocol PatientViewModelProtocol {
    
    func getPatients(request: PatientRequest,
                     completionHandler: @escaping(PagedPatientsResponse?)-> Void)
    
    func getPatientDetails(patientId: Int,
                           completionHandler: @escaping(PatientDetail?)-> Void)
    
    func searchPatient(name: String, completionHandler: @escaping([PatientRecord]?)-> Void)
}

final class PatientViewModel: ObservableObject, PatientViewModelProtocol {
    
    @Published var patients : [PatientRecord] = []
    @Published var searchPatientRecords : [PatientRecord] = []
    @Published var searchText: String = "" {
        didSet {
            debouncer.debounce {
                self.searchPatient(name: self.searchText) { patientRecord in
                    DispatchQueue.main.async {
                        self.searchPatientRecords = patientRecord ?? []
                    }
                }
            }
        }
    }

    private let debouncer: DebouncerUtility
    private var patientRepository: PatientRepositoryProtocol
    
    init(patientRepository: PatientRepositoryProtocol, debouncer: DebouncerUtility) {
        self.patientRepository = patientRepository
        self.debouncer = debouncer
    }
    
    // MARK: - Get Patients
    func getPatients(request: PatientRequest,
                     completionHandler: @escaping (PagedPatientsResponse?) -> Void) {
        
        patientRepository.getPatients(request: request) { pagedPatientResponse in
            DispatchQueue.main.async {
                self.patients = pagedPatientResponse?.records ?? []
                completionHandler(pagedPatientResponse)
            }
        }
    }
    
    // MARK: - Get Patient Details
    func getPatientDetails(patientId: Int,
                           completionHandler: @escaping (PatientDetail?) -> Void) {
        
        patientRepository.getPatientDetails(patientId: patientId) { patientDetails in
            completionHandler(patientDetails)
        }
    }
    
    // MARK: - Search Patient
    func searchPatient(name: String, completionHandler: @escaping([PatientRecord]?)-> Void) {
        
        guard name.isEmpty == false else {
            return
        }

        patientRepository.searchPatient(name: name, completionHandler: completionHandler)
    }
    
    func cancelSearch() {
        debouncer.cancel()
    }
}
