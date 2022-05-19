//
//  NetworkClient.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


protocol NetworkClient {
    
    static func sendRequest<Response: Decodable>(endpoint: Endpoint, responseType: Response.Type) async -> Result<Response, RequestError>
}


extension NetworkClient {
    
    static func sendRequest<Response: Decodable>(endpoint: Endpoint, responseType: Response.Type) async -> Result<Response, RequestError> {
        
        guard var urlComponents = URLComponents(string: endpoint.baseURL + endpoint.path) else {
            return .failure(.invalidURL)
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
                case 200...299:
                    guard let decodedResponse = try? JSONDecoder().decode(responseType, from: data) else {
                        return .failure(.cantDecode)
                    }
                    return .success(decodedResponse)
                case 401:
                    return .failure(.unauthorized)
                case 404:
                    return .failure(.notFound)
                default:
                    return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
