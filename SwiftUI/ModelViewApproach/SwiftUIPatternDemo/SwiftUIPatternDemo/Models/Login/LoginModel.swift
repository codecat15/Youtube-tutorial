//
//  LoginModel.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import SwiftUI

class LoginModel : ObservableObject {
    
    @Published var userEmail: String = String()
    @Published var userPassword: String = String()
    
    // MARK: Authenticate user
    func authenticateUser() async throws -> LoginResponse? {
        
        guard validateEmail(email: userEmail) && userPassword.isEmpty == false else {
            return nil
        }
        
        // creating urlRequest for api call
        var urlRequest = URLRequest(url: Constant.LOGIN_ENDPOINT)
        urlRequest.httpBody = createAuthenticateUserPostBody()
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let result = try await HttpClient.shared.performOperation(request: urlRequest, response: LoginResponse.self)
        
        return result != nil ? result : nil
    }
    
    // MARK: private methods
    private func validateEmail(email: String) -> Bool {
        
        guard email.isEmpty == false else {
            return false
        }
        
        let regex = try! NSRegularExpression(pattern: Constant.EMAIL_REGULAR_EXPRESSION, options: .caseInsensitive)
        
        let result = regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
        
        return result
    }

    private func createAuthenticateUserPostBody() -> Data {
        let loginRequest = LoginRequest(userEmail: userEmail, userPassword: userPassword)
        return try! JSONEncoder().encode(loginRequest)
    }
}
