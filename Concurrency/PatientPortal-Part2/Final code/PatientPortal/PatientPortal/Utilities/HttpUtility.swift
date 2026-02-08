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
    
    func executeAsync<T: Decodable>(request: URLRequest) async throws -> T?
    func fileDownloadAsync(request: URLRequest) async throws -> URL
}

final class HttpUtility : HttpUtilityProtocol {
    
    func fileDownloadAsync(request: URLRequest) async throws -> URL {
        
        do {
            let (fileUrl, response) = try await URLSession.shared.download(for: request)
            
            guard let http = response as? HTTPURLResponse else {
                throw HttpError.serverError
            }
            
            guard (200...299).contains(http.statusCode) else {
                throw HttpError.serverError
            }
            
            print("tmp directory path => \(fileUrl)")
            
           return fileUrl
        }
        catch let error {
            print("HttpUtility.fileDownloadAsync => \(error)")
            throw HttpError.serverError
        }
    }
    
    func executeAsync<T>(request: URLRequest) async throws -> T? where T : Decodable {
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let http = response as? HTTPURLResponse else {
                throw HttpError.serverError
            }
            
            guard (200...299).contains(http.statusCode) else {
                throw HttpError.serverError
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                return try decoder.decode(T.self, from: data)
                
            } catch let decodingError {
                print("HttpUtility decodingError => \(decodingError)")
                throw HttpError.serverError
            }
        }
        catch let error {
            print("HttpUtility => \(error)")
            throw HttpError.serverError
        }
    }
    
    
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
