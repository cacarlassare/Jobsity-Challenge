//
//  GetEpisodesEndpoint.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import Foundation


struct GetEpisodesEndpoint: Endpoint {
    
    init(seriesID: Int) {
        self.path = Constants.URL.tvMazeEpisodesEndpoint(seriesID: seriesID)
    }
    
    var baseURL: String = Constants.URL.tvMazeBaseURL
    var path: String
    var parameters: [String : String]?
    var method: HTTPMethod = .get
    var header: [String : String]? = ["Content-Type": "application/json;charset=utf-8"]
    var body: [String : String]?
}
