//
//  User.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/11/22.
//

import Foundation

struct User {
    let id : Int
    let name : String
    let isAdmin: Bool

    static func generateTestModel() -> User {
        return User(id: 1, name: "Codecat15", isAdmin: false)
    }
}

struct AuthenticateRequest {
    let userName, password : String?
}
