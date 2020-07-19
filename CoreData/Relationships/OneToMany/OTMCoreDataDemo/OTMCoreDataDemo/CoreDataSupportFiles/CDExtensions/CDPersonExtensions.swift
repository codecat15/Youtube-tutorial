//
//  CDPersonExtensions.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/17/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

extension CDPerson
{
    func convertToPerson() -> Person
    {
        return Person(_id: self.id!, _name: self.name!, _vehicle: self.convertToVechiles())
    }

    private func convertToVechiles() -> [Vehicle]?
    {
        guard self.toVehicle != nil && self.toVehicle?.count != 0 else {return nil}

        var vehicles: [Vehicle] = []

        self.toVehicle?.forEach({ (cdVehicle) in
            vehicles.append(cdVehicle.convertToVehicle())
        })

        return vehicles
    }
}
