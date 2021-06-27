//
//  LoginResource.swift
//  SimpleApiDemo
//
//  Created by CodeCat15 on 6/20/21.
//

import Foundation

struct LoginResource {

    func authenticate(loginRequest: LoginRequest, completionHandler:@escaping(_ result: LoginResponse?)->Void) {

        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginRequest)

        HttpUtility.shared.postData(request: urlRequest, resultType: LoginResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
