//
//  LoginResponse.swift
//  SimpleApiDemo
//
//  Created by CodeCat15 on 6/19/21.
//

import Foundation

struct LoginResponse: Decodable {
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable {
    let userName, email: String
    let userId: Int
}
