//
//  User.swift
//  EnvironmentObjectDemo
//
//  Created by CodeCat15 on 5/20/21.
//

import Foundation

class User : ObservableObject {

    @Published var name : String = String()

}

class Account : ObservableObject {
    @Published var accountBalance : Double = 0.0
}




