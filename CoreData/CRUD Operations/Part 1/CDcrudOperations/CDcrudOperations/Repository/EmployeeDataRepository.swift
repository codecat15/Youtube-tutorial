//
//  EmployeeResource.swift
//  CDcrudOperations
//
//  Created by CodeCat15 on 6/19/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

/* Thank you for downloading the source code, I hope the video was helpful and if you are having any questions then I would be happy to answer them so do feel free to ask as YouTube comment or via email codecat15@gmail.com

 Note: If you think this video was helpful and someone can benefit from it, then please do share this and if you care new to the channel I request you to please subscribe to the channel :)*/

protocol EmployeeRepository {

    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee)
    func delete(id: UUID)
}

struct EmployeeDataRepository : EmployeeRepository
{
    func create(employee: Employee) {

        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.email = employee.email
        cdEmployee.name = employee.name
        cdEmployee.id = employee.id
        cdEmployee.profilePic = employee.profilePicture

        PersistentStorage.shared.saveContext()


    }

    func getAll() -> [Employee]? {

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)

        var employees : [Employee] = []

        result?.forEach({ (cdEmployee) in
            employees.append(cdEmployee.convertToEmployee())
        })

        return employees
    }

    func get(byIdentifier id: UUID) -> Employee? {

        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)

        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

            guard result != nil else {return nil}

            return result?.convertToEmployee()

        } catch let error {
            debugPrint(error)
        }

        return nil
    }

    func update(employee: Employee) {
        // update code here
    }

    func delete(id: UUID) {
        // delete code here
    }
}
