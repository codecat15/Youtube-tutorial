//
//  EmployeeDataManager.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

struct EmployeeDataManager
{
    func create(record: Employee) {

        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = record.id
        cdEmployee.email = record.email
        cdEmployee.name = record.name

        if(record.passport != nil)
        {
            let cdPassport = CDPassport(context: PersistentStorage.shared.context)
            cdPassport.placeOfIssue = record.passport?.placeOfIssue
            cdPassport.id = record.passport?.id
            cdPassport.passportNumber = record.passport?.passportNumber
            
            cdEmployee.toPassport = cdPassport
        }
        
        PersistentStorage.shared.saveContext()
    }

    func updateEmployee(record: Employee)
    {
        let employee = getCdEmployee(byId: record.id)
        guard employee != nil else {return }


    }

    func getAllEmployee() -> [Employee]?
    {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Employee] = []
        records!.forEach({ (cdEmployee) in
            results.append(cdEmployee.convertToEmployee())
        })

        return results
    }

    func deleteEmployee(byIdentifier id: UUID) -> Bool
    {
        let employee = getCdEmployee(byId: id)
        guard employee != nil else {return false}

        PersistentStorage.shared.context.delete(employee!)
        PersistentStorage.shared.saveContext()

        return true
    }

    private func getCdEmployee(byId id: UUID) -> CDEmployee?
    {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
}
