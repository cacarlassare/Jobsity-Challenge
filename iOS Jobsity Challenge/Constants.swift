//
//  Constants.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


struct Constants {
    
    struct URL {
        
        // Base URL
        private static var tvMazeProtocol = "https"
        private static var tvMazeBaseDomain = "api.tvmaze.com"
        
        static var tvMazeBaseURL: String {
            return "\(Constants.URL.tvMazeProtocol)://\(Constants.URL.tvMazeBaseDomain)"
        }
        
        // Endpoints
        static var tvMazeSeriesEndpoint = "/shows"
        static var tvMazeSearchSeriesEndpoint = "/search/shows"
        static func tvMazeEpisodesEndpoint(seriesID: Int) -> String {
            return "/shows/\(seriesID)?embed=episodes"
        }
    }
}
