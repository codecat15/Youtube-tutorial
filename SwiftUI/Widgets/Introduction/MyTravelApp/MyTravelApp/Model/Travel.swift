//
//  Travel.swift
//  MyTravelApp
//
//  Created by CodeCat15 on 9/30/20.
//

import Foundation

struct TravelResponse : Decodable
{
    let result: [Travel]?
}

struct Travel: Decodable{
    let id: Int
    let destination, travelby, date: String?
    let reservation: Reservation?
}
