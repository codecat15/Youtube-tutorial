//
//  LoginRequest.swift
//  MvvmDemoApp
//
//  Created by Codecat15 on 3/14/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct LoginRequest : Encodable
{
    var userEmail, userPassword: String?
}
