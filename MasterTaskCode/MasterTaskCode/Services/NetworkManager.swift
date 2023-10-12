//
//  Network.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import Foundation

class NetworkManager {
    
    static let shared   = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw WeatherError.invalidUrl
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherError.invalidResponse
            
        }
        do {
            let decoderData = try decoder.decode(T.self, from: data)
            
            return decoderData
        } catch {
            print(error)
            throw WeatherError.invalidData
        }
    }
}


enum APIErrors: Error {
    case serverError
    case parsing
    case badUrl
}

enum Path: String {
    case posts = "posts/1"
}

class Network2 {
    
    static let manager = Network2()
    
    private init() {}
    
    let host = "https://jsonplaceholder.typicode.com/"
    let session = URLSession(configuration: .default)
    
    func fetchData<T: Codable>(path: Path, onCompletion handler: @escaping ((Result<T, APIErrors>) -> Void)) {
        guard let url = URL(string: host+path.rawValue) else {
            handler(.failure(.badUrl))
            return
        }
        
        session.dataTask(with: url, completionHandler: { (receivedData, receivedResponse, receivedError) -> Void in
            if receivedError != nil {
                handler(.failure(.serverError))
                return
            }
            
            if let data = receivedData {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: data)
                    handler(.success(response))
                } catch {
                    handler(.failure(.parsing))
                }
            }
        }).resume()
    }
}


/*
 Informational (1xx)
 
 100 Continue: Server has received headers and client should proceed.
 Success (2xx)
 
 200 OK: Request was successful.
 201 Created: Resource was successfully created.
 204 No Content: Successful request but no content to send back.
 Redirection (3xx)
 
 301 Moved Permanently: Resource moved permanently to another URL.
 304 Not Modified: Resource hasn't changed since last request.
 Client Errors (4xx)
 
 400 Bad Request: Server couldn't understand the request.
 401 Unauthorized: Authentication is required and failed.
 403 Forbidden: Authenticated but no permission.
 404 Not Found: Resource doesn't exist.
 405 Method Not Allowed: HTTP method is not supported for the resource.
 Server Errors (5xx)
 
 500 Internal Server Error: General server error.
 502 Bad Gateway: One server received an invalid response from another.
 503 Service Unavailable: Server is currently unavailable.
 504 Gateway Timeout: A server acting as a gateway did not get a response in time.
 
 */
