//
//  LoginViewModel.swift
//  MvvmDemoApp
//
//  Created by Codecat15 on 3/14/2020.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel
{
    var delegate : LoginViewModelDelegate?

    func loginUser(loginRequest: LoginRequest)
    {
        let validationResult = LoginValidation().Validate(loginRequest: loginRequest)

        if(validationResult.success)
        {
            //use loginResource to call login API
            let loginResource = LoginResource()
            loginResource.loginUser(loginRequest: loginRequest) { (loginApiResponse) in

                //return the response we get from loginResource
                DispatchQueue.main.async {
                    self.delegate?.didReceiveLoginResponse(loginResponse: loginApiResponse)
                }
            }
        }
        self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.error, data: nil))
    }
}
