//
//  EmployeeDataRepository.swift
//  FCDemo
//
//  Created by CodeCat15 on 8/15/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

//https://developer.apple.com/documentation/coredata/synchronizing_a_local_store_to_the_cloud
struct EmployeeDataRepository : BaseRepository
{
    func create(record: Employee) {

        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = record.id
        cdEmployee.name = record.name
        PersistentStorage.shared.saveContext()

    }

    func getAll() -> [Employee]?
    {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Employee] = []
        records!.forEach({ (cdEmployee) in
            results.append(cdEmployee.convertToEmployee())
        })

        return results
    }

    func get(byIdentifier id: UUID) -> Employee? {

        let result = self.getCdEmployee(byId: id)
        guard result != nil else {return nil}

        return result!.convertToEmployee()
    }

    func update(record: Employee) -> Bool {

        let cdEmployee = self.getCdEmployee(byId: record.id)
        guard cdEmployee != nil else {return false}

        cdEmployee?.name = record.name
        PersistentStorage.shared.saveContext()

        return true
    }

    func delete(byIdentifier id: UUID) -> Bool
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

    typealias T = Employee

}
