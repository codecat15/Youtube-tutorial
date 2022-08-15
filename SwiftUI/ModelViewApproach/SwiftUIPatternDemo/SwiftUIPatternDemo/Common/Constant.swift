//
//  Constant.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import Foundation

struct Constant {
    static let EMAIL_REGULAR_EXPRESSION = "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)"
    static let LOGIN_ENDPOINT = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")!
    static let INVALID_CREDENTIALS_ALERT_MESSAGE = "Please enter valid account details and try again"
    static let OK_ALERT_TITLE = "OK"
    static let ALERT_TITLE = "Alert"
}
