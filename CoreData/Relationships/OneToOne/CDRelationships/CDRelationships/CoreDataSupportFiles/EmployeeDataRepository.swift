//
//  EmployeeRepository.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

protocol EmployeeRepository : BaseRepository {
}

/*  Hey there thanks for downloading the code, I hope the video was helpful in covering one to one relationship and if not then please do feel free to ask questions on this topic, I will be happy to answer those questions

    If you think this video contains good information then please do share it with your iOS group

    ~CodeCat15
 */

struct EmployeeDataRepository : EmployeeRepository
{
    func create(record: Employee) {

        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = record.id
        cdEmployee.email = record.email
        cdEmployee.name = record.name
        cdEmployee.profilePicture = record.profilePicture

        if(record.passport != nil)
        {
            let cdPassport = CDPassport(context: PersistentStorage.shared.context)
            cdPassport.placeOfIssue = record.passport?.placeOfIssue
            cdPassport.passportId = record.passport?.passportId
            cdPassport.id = record.passport?.id

            cdEmployee.toPassport = cdPassport
        }

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

        cdEmployee?.email = record.email
        cdEmployee?.name = record.name
        cdEmployee?.profilePicture = record.profilePicture

        cdEmployee?.toPassport?.placeOfIssue = record.passport?.placeOfIssue
        cdEmployee?.toPassport?.passportId = record.passport?.passportId

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
