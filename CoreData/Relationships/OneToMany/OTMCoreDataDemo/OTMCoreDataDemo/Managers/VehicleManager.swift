//
//  VehicleManager.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/17/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct VehicleManager
{
    private let _vehicleDataRepository = VehicleDataRepository()
    
    func createVehicle(record: Vehicle)
    {
        _vehicleDataRepository.create(record: record)
    }

    func getAll() -> [Vehicle]?
    {
        return _vehicleDataRepository.getAll()
    }
}
