//
//  HttpUtility.swift
//  MyProject
//
//  Created by CodeCat15 on 5/28/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL,resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                //parse the responseData here
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }

        }.resume()
    }
}
