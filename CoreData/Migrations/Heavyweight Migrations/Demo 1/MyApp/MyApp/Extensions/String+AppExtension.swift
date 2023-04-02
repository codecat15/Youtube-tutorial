//
//  String+AppExtension.swift
//  MyApp
//
//  Created by CodeCat15 on 3/25/23.
//

import Foundation

extension String {
    
    /// - Returns: Returns a empty string
    static func empty() -> String { return "" }
    
    
    /// Prints the document directory path into output
    static func printDocumentDirectoryPath() {
        print(FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!.absoluteString)
    }
    
    /// Converts a string to decimal
    /// - Returns: Returns a decimal value from string
    func toDecimal() -> Decimal? {
        let result = NumberFormatter().number(from: self)?.decimalValue
        return result
    }
    
    /// Converts a string to date with dd/MM/yyyy format
    /// - Returns: Returns a date object from string
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let result = formatter.date(from: self)
        return result
    }
}
