//
//  HttpUtility.swift
//  LazyLoadingDemo
//
//  Created by CodeCat15 on 7/4/21.
//

import Foundation


final class HttpUtility {

    static let shared = HttpUtility()
    private init(){}

    func postData<T:Decodable>(request: URLRequest, resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void) {

        processRequest(request: request, resultType: resultType) { response in
            _ = completionHandler(response)
        }
    }

    func getData<T:Decodable>(request: URLRequest, resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void) {

        processRequest(request: request, resultType: resultType) { response in
            _ = completionHandler(response)
        }
    }

    private func processRequest<T:Decodable>(request: URLRequest,resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void ) {

        URLSession.shared.dataTask(with: request) { data, response, error in
            if(error == nil && data != nil) {
                do {
                    let response = try JSONDecoder().decode(resultType.self, from: data!)
                    _ = completionHandler(response)
                } catch  {
                    debugPrint("error occured \(error)")
                    _ = completionHandler(nil)}
            }
        }.resume()
    }
}
