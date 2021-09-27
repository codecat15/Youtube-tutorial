//
//  AnimalRepository.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//

import Foundation
import CoreData


/*
Thank you for downloading the code, I hope the video was helpful to you and if you have any questions then please feel free to ask them via comments or via email and I will be happy to respond to them.

 If you are new to the channel then please do support the channel by subscribing and sharing it with your iOS group.

 Thank you once again for your time

 Regards,
 Ravi (Codecat15) :)

 */


struct AnimalDataRepository : AnimalCoreDataRepository {

    func batchInsertAnimalRecords(records: Array<Animal>) -> Bool {

        PersistentStorage.shared.printDocumentDirectoryPath()

        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in

            // batch inserts
            let request = self.createBatchInsertRequest(records: records)
            do{
                try privateManagedContext.execute(request)
            }catch {
                debugPrint("batch insert error")
            }
        }

        return true

    }

    private func createBatchInsertRequest(records:Array<Animal>) -> NSBatchInsertRequest {

        let totalCount = records.count
        var index = 0

        let batchInsert = NSBatchInsertRequest(entity: CDAnimal.entity()) { (managedObject: NSManagedObject) -> Bool in

            guard index < totalCount else {return true}

            if let animal = managedObject as? CDAnimal {
                let data = records[index]
                animal.id = UUID()
                animal.name = data.name
                animal.image = data.image
            }

            index  += 1
            return false
        }

        return batchInsert

    }

    func insertAnimalRecords(records: Array<Animal>) -> Bool {

        debugPrint("AnimalDataRepository: Insert record operation is starting")

        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in
            //insert code
            records.forEach { animalRecord in
                let cdAnimal = CDAnimal(context: privateManagedContext)
                cdAnimal.id = UUID()
                cdAnimal.name = animalRecord.name
                cdAnimal.image = animalRecord.image
            }

            if(privateManagedContext.hasChanges){
                try? privateManagedContext.save()
                debugPrint("AnimalDataRepository: Insert record operation is completed")
            }
        }

        return true
    }


    func getAnimalRecords(completionHandler: @escaping (Array<Animal>?) -> Void) {

        //PersistentStorage.shared.printDocumentDirectoryPath()

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDAnimal.self)
            var animals : Array<Animal> = []
            result?.forEach({ (cdAnimal) in
                animals.append(cdAnimal.convertToAnimal())
            })

            completionHandler(animals)

    }
}
