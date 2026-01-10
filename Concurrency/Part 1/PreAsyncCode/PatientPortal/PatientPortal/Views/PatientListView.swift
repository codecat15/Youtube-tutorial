//
//  PatientListView.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import SwiftUI

struct PatientListView: View {
    @State private var isLoading: Bool = false
    @StateObject private var viewModel = PatientViewModel(
        patientRepository: PatientRepository.defaultRepository,
        debouncer: DebouncerUtility(debounceTime: 1.0, queue: .global())
    )
    
    var filteredPatients: [PatientRecord] {
        if viewModel.searchText.isEmpty {
            return viewModel.patients
        } else if viewModel.searchPatientRecords.isEmpty {
            return viewModel.patients.filter { $0.fullName.lowercased().contains(viewModel.searchText.lowercased()) }
        } else {
            return viewModel.searchPatientRecords
        }
    }
    var loadingView: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading patient list ...")
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
    
    func patientRecord(_ patient: PatientRecord) -> some View {
        NavigationLink(
            destination: PatientDetailsView(
                patientId: patient.id,
                viewModel: viewModel
            )
        ) {
            VStack(alignment: .leading, spacing: 6) {
                Text(patient.fullName)
                    .fontWeight(.semibold)

                Text("\(patient.wardNumber) · \(patient.bed)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(patient.doctorName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
        }
    }

    var body: some View {

        NavigationStack {

            VStack {

                if isLoading {

                    self.loadingView

                } else if filteredPatients.isEmpty {

                    ContentUnavailableView.search

                } else {

                    List(filteredPatients) { patient in
                        self.patientRecord(patient)
                    }
                    .listStyle(.insetGrouped)
                    .navigationBarTitleDisplayMode(.large)
                    
                    VStack {
                        Text("Showing \(filteredPatients.count) of \(viewModel.patients.count) patients")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("Patients")
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .refreshable {
            loadPatients()
        }
        .onAppear {
            if viewModel.patients.isEmpty {
                loadPatients()
            }
        }
    }

    private func loadPatients() {
        isLoading = true
        viewModel.getPatients(request: PatientRequest(take: 10, skip: 0)) { _ in
            self.isLoading = false
        }
    }
}
