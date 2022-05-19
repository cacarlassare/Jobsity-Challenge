//
//  Endpoint.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


protocol Endpoint {
    
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: String]? { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}
