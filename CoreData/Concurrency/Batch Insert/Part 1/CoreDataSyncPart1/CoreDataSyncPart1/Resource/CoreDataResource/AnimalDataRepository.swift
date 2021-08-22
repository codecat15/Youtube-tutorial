//
//  AnimalRepository.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//

import Foundation
import CoreData

struct AnimalDataRepository : AnimalCoreDataRepository {

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

        PersistentStorage.shared.printDocumentDirectoryPath()

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDAnimal.self)
            var animals : Array<Animal> = []
            result?.forEach({ (cdAnimal) in
                animals.append(cdAnimal.convertToAnimal())
            })

            completionHandler(animals)

    }
}
