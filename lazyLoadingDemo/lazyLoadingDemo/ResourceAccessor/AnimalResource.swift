//
//  HeroesResource.swift
//  lazyLoadingDemo
//
//  Created by CodeCat15 on 7/24/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct AnimalResource
{
    func getAnimals(completionHandler: @escaping (AnimalResponse?) -> ()) {

        let animalApiUrl = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")!

        URLSession.shared.dataTask(with: animalApiUrl) { (data, response, error) in

            if(error == nil && data != nil)
            {
                do {
                    let result = try JSONDecoder().decode(AnimalResponse.self, from: data!)

                    completionHandler(result)

                } catch let error {
                    debugPrint(error)
                }
            }

        }.resume()


    }
}
