//
//  AuthResource.swift
//  AsyncAwaitDemo
//
//  Created by CodeCat15 on 11/15/21.
//

import Foundation

struct AuthResource {

    func getToken() async throws -> AuthResponse {
        var urlRequest = URLRequest(url: Service.token)
        urlRequest.httpMethod = "get"

        do {
            return try await HttpUtility.shared.performOperation(request: urlRequest, response: AuthResponse.self)
        } catch  {
            throw error
        }


        //        HttpUtility.shared.performOperation(request: urlRequest, response: AuthResponse.self) { serviceResult, serviceError in
        //            guard serviceError == nil else {
        //                return completionHandler(nil)
        //            }
        //            completionHandler(serviceResult)
        //        }
    }
}
