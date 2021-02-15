//
//  HttpUtility.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import Foundation

/**
 If you like the code here then do watch the API series where we are building this utility from scratch and learning how to use generics to make it even more robust. I have also released the HTTPUtility as pod, the code is open source you can fork it or request a feature

 Source code link: https://github.com/codecat15/HttpUtility
 Api series playlist: https://youtube.com/playlist?list=PLb5R4QC2DtFuXr4177KQ2lIXOkqwq97a4
 */
struct HttpUtility {

    static let shared = HttpUtility()
    private init() {}

    public func request<T:Decodable>(urlRequest: URLRequest, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void) {

        URLSession.shared.dataTask(with: urlRequest) { (serverData, urlResponse, error) in
            if(error == nil && serverData != nil){
                do {
                    //debugPrint(String(data: serverData!, encoding: .utf8))
                   let result = try JSONDecoder().decode(T.self, from: serverData!)
                    completionHandler(result)
                } catch {
                    debugPrint("parser error = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
