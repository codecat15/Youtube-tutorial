//
//  LoginResponse.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import Foundation

struct LoginResponse : Decodable {
    let errorMessage: String?
    let data: User?
}

struct User: Decodable {
    let userName, email: String
    let userId: Int
}
