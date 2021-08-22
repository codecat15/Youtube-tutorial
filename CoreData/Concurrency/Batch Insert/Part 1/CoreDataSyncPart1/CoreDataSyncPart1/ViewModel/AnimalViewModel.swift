//
//  AnimalViewModel.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//

import Foundation

/*
Thank you for downloading the source code, I hope the video was helpful in covering about traditional batch insert approach along with writing clean and maintainable code.

 If you have any questions then please feel free to ask, all questions are welcome.

 Do support the channel by sharing the video among your iOS group, help the channel to grow so that more of such content is available and all you have to do is subscribe and share.

 Thank you for taking time and watching the video, Have a nice day

 Ravi (CodeCat15) :)

 */

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
                      _ = _cdAnimalDataRepository.insertAnimalRecords(records: apiResponse!)
                        debugPrint("AnimalViewModel: Returning records to view controller")
                        completionHandler(apiResponse)
                    }
                }
            }
        }

    }
}
