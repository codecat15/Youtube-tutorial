//
//  StringExtensions.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 11/13/20.
//

import Foundation

extension String {
    func validateEmail() -> Bool{
        let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil
    }
}
