//
//  Reservation.swift
//  MyTravelApp
//
//  Created by CodeCat15 on 9/30/20.
//

import Foundation

struct Reservation: Decodable {
    let id: Int
    let hotelName,stayFrom, stayTo: String?
    let totalCost: Int?
}
