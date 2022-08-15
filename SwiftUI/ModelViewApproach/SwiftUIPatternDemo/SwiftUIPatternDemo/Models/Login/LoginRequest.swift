//
//  LoginRequest.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail : String
    let userPassword: String
}
