//
//  AnimalResource.swift
//  LazyLoadingDemo
//
//  Created by CodeCat15 on 7/4/21.
//

import Foundation

struct AnimalResource {

    func getAnimalList(completionHandler: @escaping(_ result: AnimalResponse?) -> Void){

        var urlRequest = URLRequest(url: URLEndpoint.getAnimal)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        HttpUtility.shared.getData(request: urlRequest, resultType: AnimalResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
