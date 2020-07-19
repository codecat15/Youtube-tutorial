//
//  VehicleDataRepository.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/17/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

protocol VehicleRepository : BaseRepository {

}

/* Hey there, this is Ravi, I hope this video was helpful to you and provided all the right set of information to get you started with one to Many relationship in coredata.

If you have any questions then please feel free to ask them as commnets or you can ask them to me via email. My email id is codecat15@gmail.com

Please do support the channel by sharing it with you iOS group or class on Facebook or WhatsApp.

Regards,
Ravi (CodeCat15)

*/


struct VehicleDataRepository: VehicleRepository {
    
    func create(record: Vehicle) {

        let cdVehicle = CDVehicle(context: PersistentStorage.shared.context)
        cdVehicle.id = record.id
        cdVehicle.name = record.name
        cdVehicle.type = record.type

        PersistentStorage.shared.saveContext()
    }

    func getAll() -> [Vehicle]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDVehicle.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Vehicle] = []
        records!.forEach({ (cdVehicle) in
            results.append(cdVehicle.convertToVehicle())
        })

        return results
    }

    func get(byIdentifier id: UUID) -> Vehicle? {

        let vehicle = getCdVehicle(byId: id)
        guard vehicle != nil else {return nil}
        return (vehicle?.convertToVehicle())!
    }

    func update(record: Vehicle) -> Bool {
        let vehicle = getCdVehicle(byId: record.id)
        guard vehicle != nil else {return false}

        vehicle?.type = record.type
        vehicle?.name = record.name

        PersistentStorage.shared.saveContext()
        return true
    }

    func delete(byIdentifier id: UUID) -> Bool {

        let vehicle = getCdVehicle(byId: id)
        guard vehicle != nil else {return false}

        PersistentStorage.shared.context.delete(vehicle!)
        PersistentStorage.shared.saveContext()

        return true
    }

    private func getCdVehicle(byId id: UUID) -> CDVehicle?
    {
        let fetchRequest = NSFetchRequest<CDVehicle>(entityName: "CDVehicle")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }


    typealias T = Vehicle




}
