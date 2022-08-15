//
//  HttpClient.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import Foundation

enum httpError : Error {
    case nonSuccessStatusCode
    case jsonDecodingError
    case otherError
}

class HttpClient {
    
    static let shared = HttpClient()
    private init(){}
    
    func performOperation<T:Decodable>(request: URLRequest, response: T.Type) async throws -> T? {
        
        do {
            
            let (serverData, serverUrlResponse) = try await URLSession.shared.data(for:request)
            guard let httpStausCode = (serverUrlResponse as? HTTPURLResponse)?.statusCode,
                  (200...299).contains(httpStausCode) else {
                throw httpError.nonSuccessStatusCode
            }
            
            do {
                let result = try JSONDecoder().decode(response.self, from: serverData)
                return result
            }
            catch {
                throw httpError.jsonDecodingError
            }
        } catch {
            throw httpError.otherError
        }
    }
}
