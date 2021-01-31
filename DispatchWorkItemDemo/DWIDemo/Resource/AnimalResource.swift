//
//  AnimalResource.swift
//  DWIDemo
//
//  Created by CodeCat15 on 1/28/21.
//

import Foundation

struct AnimalResource
{
    func searchAnimal(name: String, completion: @escaping(_ result: [Animal]?) -> Void){

        let searchUrl = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/SearchAnimal?name=\(name)")!
        URLSession.shared.dataTask(with: searchUrl) { (searchData, serverResponse, serverError) in
            if(serverError == nil && searchData != nil){
                do {
                   let result = try JSONDecoder().decode(AnimalResponse.self, from: searchData!)
                    completion(result.animals != nil ? result.animals : [])
                } catch {
                    debugPrint("Error in decoding")
                }
            }
        }.resume()
    }
}
