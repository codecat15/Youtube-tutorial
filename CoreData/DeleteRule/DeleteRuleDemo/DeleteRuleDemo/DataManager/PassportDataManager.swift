//
//  PassportDataManager.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

struct PassportDataManager
{
    func create(record: Passport)
    {
        let cdPassport = CDPassport(context: PersistentStorage.shared.context)
        cdPassport.placeOfIssue = record.placeOfIssue
        cdPassport.id = record.id
        cdPassport.passportNumber = record.passportNumber

        PersistentStorage.shared.saveContext()
    }

    func getAllPassport() -> [Passport]?
    {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDPassport.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Passport] = []
        records!.forEach({ (cdPassport) in
            results.append(cdPassport.convertToPassport()!)
        })

        return results
    }

    func deletePassport(byId id: UUID) -> Bool
    {
        let employee = getCdPassport(byId: id)
        guard employee != nil else {return false}

        PersistentStorage.shared.context.delete(employee!)
        PersistentStorage.shared.saveContext()

        return true
    }

    private func getCdPassport(byId id: UUID) -> CDPassport?
    {
        let fetchRequest = NSFetchRequest<CDPassport>(entityName: "CDPassport")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }

}
