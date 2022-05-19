//
//  GetSeriesEndpoint.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


struct GetSeriesEndpoint: Endpoint {
    
    var baseURL: String = Constants.URL.tvMazeBaseURL
    var path: String = Constants.URL.tvMazeSeriesEndpoint
    var parameters: [String : String]?
    var method: HTTPMethod = .get
    var header: [String : String]? = ["Content-Type": "application/json;charset=utf-8"]
    var body: [String : String]?
}
