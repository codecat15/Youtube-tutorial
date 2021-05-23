//
//  User.swift
//  ObservableObjectDemo
//
//  Created by CodeCat15 on 5/17/21.
//

import Foundation

class User : ObservableObject {

    @Published var name: String = String()
    @Published var lastName : String = String()
}
