//
//  PatientDetailsView.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import SwiftUI

struct PatientDetailsView: View {
    let patientId: Int
    let viewModel: PatientViewModel

    @State private var patientDetail: PatientDetail?
    @State private var isLoading = true
    @State private var errorMessage: String?
    @Environment(\.presentationMode) var presentationMode

    var loadingView: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading patient details...")
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }

    private func patientName(_ patient: PatientDetail) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(patient.fullName)
                .font(.system(size: 24, weight: .semibold))

            Text("MRN: \(patient.mrn)")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Age: \(patient.age), Sex: \(patient.sex)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var body: some View {
        VStack {
            if isLoading {
                
                loadingView

            } else if let error = errorMessage {

                ContentUnavailableView(error, systemImage: "exclamationmark.square.fill")

            } else if let patient = patientDetail {

                List {

                    Section(header: Text("Patient name")) {
                        self.patientName(patient)
                    }
                    
                    Section(header: Text("Location")) {
                        Text("Ward: \(patient.ward.name) · \(patient.ward.number) · \(patient.ward.bed)")
                            .font(.body)
                    }
                    
                    Section(header: Text("Care Team")) {
                        Text("Treating Doctor: \(patient.treatingDoctor.name) (\(patient.treatingDoctor.specialty))")
                            .font(.body)
                    }
                    
                    Section(header: Text("Clinical")) {
                        VStack(alignment: .leading, spacing: 8) {
                            if !patient.conditions.isEmpty {
                                Text("Conditions: \(patient.conditions.joined(separator: ", "))")
                                    .font(.body)
                            }
                            if !patient.symptoms.isEmpty {
                                Text("Symptoms: \(patient.symptoms.joined(separator: ", "))")
                                    .font(.body)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if !patient.medications.isEmpty {
                        Section(header: Text("Medications")) {
                            ForEach(patient.medications) { medication in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(medication.name)
                                        .font(.body)
                                    Text("\(medication.dose) · \(medication.frequency)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    
                    Section(header: Text("Updated At")) {
                        Text("Last updated: \(formatDate(patient.lastUpdatedUtc))")
                            .font(.caption)
                    }
                }
                .listStyle(.insetGrouped)
            }
            
            // Bottom action buttons
            if !isLoading && errorMessage == nil && patientDetail != nil {
                VStack {
                    VStack(spacing: 12) {
                        Button(action: { downloadReport() }) {
                            Text("Download Report")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Patient Summary")
                    .font(.headline)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { loadPatientDetails() }) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.blue)
                }
            }
        }
        .onAppear {
            loadPatientDetails()
        }
    }
    
    private func loadPatientDetails() {
        isLoading = true
        errorMessage = nil
        viewModel.getPatientDetails(patientId: patientId) { patient in
            self.patientDetail = patient
            self.isLoading = false
            if patient == nil {
                self.errorMessage = "Failed to load patient details. Please try again."
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func downloadReport() {
        print("Downloading report for patient \(patientId)")
    }
}
