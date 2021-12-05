//
//  HttpUtility.swift
//  AsyncAwaitDemo
//
//  Created by CodeCat15 on 11/15/21.
//

import Foundation

enum httpError : Error {
    case jsonDecoding
    case noData
    case nonSuccessStatusCode
    case serverError
    case emptyCollection
    case emptyObject
}


/**

 Thank you for downloading the code, if the video was helpful I request you to please share it with your iOS group on whatsapp, slack or teams, I humbly appreciate the support.

 Please do feel free to ask questions, don't hesitate to ask maybe your question can teach me something new as well.

 If you are new to the channel, do consider subscirbing to the channel, this way I am always motivated to bring out the best content for free and all it takes is just subscribing to the channel which is free as well :)

 Regards,
 CodeCat15 (Ravi)

 */


final class HttpUtility {

    static let shared: HttpUtility = HttpUtility()
    private init() {}
    
    func performOperation<T:Decodable>(request: URLRequest, response: T.Type,
                                       completionHandler:
                                       @escaping(T?, Error?)->Void) {

        URLSession.shared.dataTask(with: request) { serverData, serverResponse, serverError in

            // check for error
            guard serverError == nil else { return completionHandler(nil,httpError.serverError) }

            // check for success staus code
            guard let httpStausCode = (serverResponse as? HTTPURLResponse)?.statusCode,
                  (200...299).contains(httpStausCode) else {
                      return completionHandler(nil, httpError.nonSuccessStatusCode)
                  }

            // check if serverData is not empty
            guard serverData?.isEmpty == false else {
                return completionHandler(nil,httpError.noData)

            }

            // decode the result
            do {
                let result = try JSONDecoder().decode(response.self, from: serverData!)
                completionHandler(result,nil) // return success
            }catch {
                // return decode error
                completionHandler(nil,error)
            }
        }.resume()
    }

    func performOperation<T:Decodable>(request: URLRequest, response: T.Type) async throws -> T{

        do {
            let (serverData, serverUrlResponse) = try await URLSession.shared.data(for:request)

            guard let httpStausCode = (serverUrlResponse as? HTTPURLResponse)?.statusCode,
                  (200...299).contains(httpStausCode) else {
                      throw httpError.nonSuccessStatusCode
                  }

            return try JSONDecoder().decode(response.self, from: serverData)

        } catch  {
            throw error
        }
    }
}
