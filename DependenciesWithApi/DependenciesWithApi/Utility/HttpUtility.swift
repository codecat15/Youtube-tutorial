//
//  HttpUtility.swift
//  DependenciesWithApi
//
//  Created by CodeCat15 on 3/26/21.
//

import Foundation

// MARK: - HttpUtility
struct HttpUtility
{
    static let shared = HttpUtility()
    private init(){}
    func getData<T:Decodable>(request: URLRequest, response: T.Type, handler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: request) { (data, httpUrlResponse, error) in
            if(error == nil && data != nil && data?.count != 0) {
                do {
                   let decoder = JSONDecoder()
                    // for date formatting
                    decoder.dateDecodingStrategy = .iso8601
                    let result = try decoder.decode(response, from: data!)
                    handler(result)
                } catch  {
                    debugPrint(error.localizedDescription)
                }

            }}.resume()
    }
}
