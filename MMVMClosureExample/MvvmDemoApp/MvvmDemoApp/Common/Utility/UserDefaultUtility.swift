//
//  UserDefaultUtility.swift
//  MvvmDemoApp
//
//  Created by CodeCat15 on 3/18/20.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct UserDefaultUtility
{
    func saveUserId(userId: Int)
    {
        UserDefaults.standard.set(userId, forKey: "userId")
    }

    func getUserId() -> Int
    {
        return UserDefaults.standard.value(forKey: "userId") as! Int
    }
}
