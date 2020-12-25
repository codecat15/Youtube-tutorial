//
//  LoginHandler.swift
//  TestCaseDemo
//
//  Created by CodeCat15 on 12/24/20.
//

import Foundation

struct LoginHandler {

    private let validation = LoginValidation()
    private let loginApiResource = LoginApiResource()

    func authenticateUser(request: LoginRequest, completionHandler: @escaping(_ loginData: LoginData?)->()) {

        let validationResult = validation.validate(request: request)
        if(validationResult.isValid) {
            loginApiResource.authenticateUser(request: request) { (response) in
                // return it back to the caller
                completionHandler(LoginData(errorMessage: nil, response: response))
            }
        }
        completionHandler(LoginData(errorMessage: validationResult.message, response: nil))
    }
}
