//
//  CDVehicleExtensions.swift
//  OTMCoreDataDemo
//
//  Created by CodeCat15 on 7/18/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

extension CDVehicle
{
    func convertToVehicle() -> Vehicle
    {
        return Vehicle(_id: self.id!, _name: self.name!, _type: self.type!)
    }
}
