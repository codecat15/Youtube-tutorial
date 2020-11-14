//
//  LoginValidation.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 11/13/20.
//

import Foundation

struct LoginValidation  {

    func validate(request: LoginRequest) -> ValidationResult {

        if(request.userEmail.count > 0 && request.userPassword.count > 0){
            if(request.userEmail.validateEmail()){
                return ValidationResult(success: true, errorMessage: nil)
            }else{
                return ValidationResult(success: false, errorMessage: "Please enter a valid email")
            }
        }

        return ValidationResult(success: false, errorMessage: "Please enter valid credentials")
    }

}
