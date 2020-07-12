//
//  PassportManager.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct PassportManager {

    private let _passportRepository : PassportDataRepository = PassportDataRepository()

    func create(record: Passport)
    {
        _passportRepository.create(record: record)
    }

    func getAllPassports() -> [Passport]?
    {
        return _passportRepository.getAll()
    }

    func deleteEmployee(byIdentifier id: UUID) -> Bool
    {
        return _passportRepository.delete(byIdentifier: id)
    }
}
