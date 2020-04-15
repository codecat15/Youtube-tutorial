//
//  HttpUtility.swift
//  MvvmDemoApp
//
//  Created by Codecat15 on 3/14/2020.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
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

    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(error == nil && data != nil && data?.count != 0)
            {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                }
            }

        }.resume()
    }

    // Use the Multipart API to refractor this code, you may use the image api boundary format for your reference and if you are stuck then feel free to contact, I will be happy to help you.
    
    func postApiDataWithMultipartForm<T:Decodable>(requestUrl: URL, request: ImageRequest, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        let lineBreak = "\r\n"

        urlRequest.httpMethod = "post"
        let boundary = "---------------------------------\(UUID().uuidString)"
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "content-type")

        var requestData = Data()

        requestData.append("--\(boundary)\r\n" .data(using: .utf8)!)
        requestData.append("content-disposition: form-data; name=\"attachment\" \(lineBreak + lineBreak)" .data(using: .utf8)!)
        requestData.append(request.attachment .data(using: .utf8)!)

        requestData.append("\(lineBreak)--\(boundary)\r\n" .data(using: .utf8)!)
        requestData.append("content-disposition: form-data; name=\"fileName\" \(lineBreak + lineBreak)" .data(using: .utf8)!)
        requestData.append("\(request.fileName + lineBreak)" .data(using: .utf8)!)

        requestData.append("--\(boundary)--\(lineBreak)" .data(using: .utf8)!)

        urlRequest.addValue("\(requestData.count)", forHTTPHeaderField: "content-length")
        urlRequest.httpBody = requestData

       // let multipartStr = String(decoding: requestData, as: UTF8.self) //to view the multipart form string

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(error == nil && data != nil && data?.count != 0)
            {
            // let dataStr = String(decoding: requestData, as: UTF8.self) //to view the data you receive from the API
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                }
            }

        }.resume()

    }
}
