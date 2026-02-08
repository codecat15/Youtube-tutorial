//
//  FileStore.swift
//  PatientPortal
//
//  Created by CodeCat15 on 2/5/26.
//

import Foundation
@MainActor
final class FileStore {
    
    private let fileManager = FileManager.default
    
    func saveReport(tempURL: URL, rootDirectory: String, path: String, fileName: String) throws -> URL {
        
        let documentsDir = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
        
        let patientDir = documentsDir.appendingPathComponent(String(rootDirectory),isDirectory: true)
        
        let typeDir = patientDir.appendingPathComponent(path, isDirectory: true)
        try fileManager.createDirectory(at: typeDir, withIntermediateDirectories: true)
        
        let fileName = fileName + ".pdf"
        let destinationURL = typeDir.appendingPathComponent(fileName, isDirectory: false)
        
        if fileManager.fileExists(atPath: destinationURL.path) {
            try fileManager.removeItem(at: destinationURL)
        }
        
        // MOVE
        try fileManager.moveItem(at: tempURL, to: destinationURL)
        
        return destinationURL
    }
}
