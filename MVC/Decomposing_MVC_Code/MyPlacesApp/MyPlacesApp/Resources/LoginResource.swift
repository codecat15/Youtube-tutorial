//
//  LoginResource.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 11/13/20.
//

import Foundation

struct LoginResource{
    
    func authenticateUser(request: LoginRequest, completionHandler:@escaping (_ result: LoginResponse?)->()) {
        
        var urlRequest = URLRequest(url: URL(string: API.login)!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try! JSONEncoder().encode(request)

        HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: LoginResponse.self) { (result) in
            _ = completionHandler(result)
        }
    }
}
