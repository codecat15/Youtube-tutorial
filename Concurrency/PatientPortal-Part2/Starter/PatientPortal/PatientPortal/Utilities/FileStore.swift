//
//  FileStore.swift
//  PatientPortal
//
//  Created by CodeCat15 on 2/5/26.
//

import Foundation

final class FileStore {
    
    private let fileManager = FileManager.default
    
    func saveReport(tempURL: URL, rootDirectory: String, path: String, fileName: String) throws -> URL {
        
        let documentsDir = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
        
        // Documents/1001
        let patientDir = documentsDir.appendingPathComponent(
            String(rootDirectory),
            isDirectory: true
        )
        
        let typeDir = patientDir.appendingPathComponent(path, isDirectory: true)
        
        // Creates BOTH patientDir and typeDir if missing
        try fileManager.createDirectory(at: typeDir, withIntermediateDirectories: true)
        
        // Documents/1001/LabResult/rpt-....pdf
        let fileName = fileName + ".pdf"
        let destinationURL = typeDir.appendingPathComponent(fileName, isDirectory: false)
        
        if fileManager.fileExists(atPath: destinationURL.path) {
            try fileManager.removeItem(at: destinationURL)
        }
        
        print("destinationURL =>  \(destinationURL) \n")
        
        // MOVE
        try fileManager.moveItem(at: tempURL, to: destinationURL)
        
        return destinationURL
    }
}
