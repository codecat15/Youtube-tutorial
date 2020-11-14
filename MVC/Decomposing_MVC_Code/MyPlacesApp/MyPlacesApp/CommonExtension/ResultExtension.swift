//
//  ResultExtension.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 11/13/20.
//

import Foundation
import CoreLocation

extension Result{
    func toPlaceAnnotation() -> PlaceAnnotation{

        let latitude = self.geometry?.location?.lat
        let longitude = self.geometry?.location?.lng

        return PlaceAnnotation(_title: self.name!, _coordinate: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!))
    }
}
