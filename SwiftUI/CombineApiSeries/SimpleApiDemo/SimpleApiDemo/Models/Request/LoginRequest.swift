//
//  LoginRequest.swift
//  SimpleApiDemo
//
//  Created by CodeCat15 on 6/19/21.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail, userPassword: String
}
