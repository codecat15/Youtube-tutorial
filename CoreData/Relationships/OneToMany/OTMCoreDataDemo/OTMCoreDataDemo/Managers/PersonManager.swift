//
//  PersonManager.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/17/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct PersonManager
{
    private let _personDataRepository = PersonDataRepository()
    
    func createPerson(record: Person) -> Bool
    {
        guard record.vehicles != nil && record.vehicles!.count <= 2 else {return false}
        _personDataRepository.create(record: record)
        
        return true
    }

    func getAll() -> [Person]?
    {
        return _personDataRepository.getAll()
    }
}
