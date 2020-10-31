//
//  LoginResponse.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import Foundation

struct LoginResponse : Decodable {
    let errorMessage: String?
    let data: User?
}

struct User: Decodable {
    let userName: String?
    let userId: Int?
    let email: String?
}

