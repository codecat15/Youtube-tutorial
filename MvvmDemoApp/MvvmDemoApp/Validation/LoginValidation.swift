//
//  LoginValidation.swift
//  MvvmDemoApp
//
//  Created by CodeCat15 on 3/14/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct LoginValidation {

    func Validate(loginRequest: LoginRequest) -> ValidationResult
    {
        if(loginRequest.userEmail!.isEmpty)
        {
            return ValidationResult(success: false, error: "User email is empty")
        }

        if(loginRequest.userPassword!.isEmpty)
        {
            return ValidationResult(success: false, error: "User password is empty")
        }

        return ValidationResult(success: true, error: nil)
    }

}
