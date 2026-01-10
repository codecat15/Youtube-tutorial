//
//  HttpUtility.swift
//  PatientPortal
//
//  Created by CodeCat15 on 12/31/25.
//

import Foundation

enum HttpError: Error {
    case responseDecodingError
    case serverError
}

protocol HttpUtilityProtocol {
    func execute<T: Decodable>(
        request: URLRequest,
        completion: @escaping (Result<T?, HttpError>?) -> Void
    )
}

final class HttpUtility : HttpUtilityProtocol {
    
    func execute<T:Decodable>(request: URLRequest,
                completion: @escaping (Result<T?, HttpError>?) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.serverError))
                return
            }
            
            guard let http = response as? HTTPURLResponse else {
                completion(.failure(.serverError))
                return
            }
            
            guard (200...299).contains(http.statusCode) else {
                completion(.failure(.serverError))
                return
            }
            
            guard let data else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decoded = try decoder.decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.responseDecodingError))
            }
            
        }
        
        dataTask.resume()
    }
}
