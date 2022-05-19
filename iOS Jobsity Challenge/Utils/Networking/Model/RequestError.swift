//
//  RequestError.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


enum RequestError: LocalizedError {
    
    case cantDecode
    case invalidURL
    case notFound
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
        
    
    var errorDescription: String? {
        switch self {
        case .cantDecode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
