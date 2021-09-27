//
//  AnimalRepository.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/15/21.
//

import Foundation

protocol AnimalBaseRepository {
    func getAnimalRecords(completionHandler:@escaping(_ result: Array<Animal>?)->Void)
}

protocol AnimalCoreDataRepository : AnimalBaseRepository {
    func insertAnimalRecords(records:Array<Animal>) -> Bool
    func batchInsertAnimalRecords(records:Array<Animal>) -> Bool
}

protocol AnimalApiResourceRepository : AnimalBaseRepository {
}
