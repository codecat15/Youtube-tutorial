//
//  PlaceResource.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 11/13/20.
//

import Foundation

struct PlaceResource
{
    func getNearByPlaces(request: PlacesRequest, completionHandler:@escaping(_ result: PlacesResponse?)->Void){

        let apiUrl = "\(API.places)\(request.location)&radius=\(request.radius)&type=\(request.type)&sensor=true&key=\(API.key)"

        var urlRequest = URLRequest(url: URL(string: apiUrl)!)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: PlacesResponse.self) { (placesResponse) in
            _ = completionHandler(placesResponse)
        }
    }
}
