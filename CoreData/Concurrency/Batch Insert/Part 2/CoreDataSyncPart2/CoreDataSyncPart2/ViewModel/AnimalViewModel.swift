//
//  AnimalViewModel.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//

import Foundation

struct AnimalViewModel {

    private let _cdAnimalDataRepository : AnimalCoreDataRepository = AnimalDataRepository()
    private let _animalApiRepository: AnimalApiResourceRepository = AnimalApiRepository()

    func getAnimalRecord(completionHandler:@escaping(_ result: Array<Animal>?)-> Void) {

        _cdAnimalDataRepository.getAnimalRecords { response in
            if(response != nil && response?.count != 0){
                // return response to the view controller
                completionHandler(response)

            }else {
                // call the api
                _animalApiRepository.getAnimalRecords { apiResponse in
                    if(apiResponse != nil && apiResponse?.count != 0){

                        // insert record in core data
                      _ = _cdAnimalDataRepository.batchInsertAnimalRecords(records: apiResponse!)
                        completionHandler(apiResponse)
                    }
                }
            }
        }

    }
}
