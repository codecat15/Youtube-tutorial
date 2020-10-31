//
//  LoginRequest.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail, userPassword: String
}
