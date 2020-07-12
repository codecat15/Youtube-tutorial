//
//  PassportRepository.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

protocol PassportRepository : BaseRepository {
}

/*  Hey there thanks for downloading the code, I hope the video was helpful in covering one to one relationship and if not then please do feel free to ask questions on this topic, I will be happy to answer those questions

   If you think this video contains good information then please do share it with your iOS group

   ~CodeCat15
*/

struct PassportDataRepository : PassportRepository
{
    func create(record: Passport)
    {
        let cdPassport = CDPassport(context: PersistentStorage.shared.context)
        cdPassport.placeOfIssue = record.placeOfIssue
        cdPassport.id = record.id
        cdPassport.passportId = record.passportId

        PersistentStorage.shared.saveContext()
    }

    func getAll() -> [Passport]?
    {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDPassport.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Passport] = []
        records!.forEach({ (cdPassport) in
            results.append(cdPassport.convertToPassport()!)
        })

        return results
    }

    func get(byIdentifier id: UUID) -> Passport? {

        let result = self.getCdPassport(byId: id)
        guard result != nil else {return nil}
        return result!.convertToPassport()
    }

    func update(record: Passport) -> Bool
    {
        let cdPassport = self.getCdPassport(byId: record.id)
        guard cdPassport != nil else {return false}
        return false
    }

    func delete(byIdentifier id: UUID) -> Bool
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

    typealias T = Passport


}
