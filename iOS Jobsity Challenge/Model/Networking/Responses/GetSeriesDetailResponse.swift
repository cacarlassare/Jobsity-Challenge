//
//  GetSeriesDetailResponse.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import Foundation


struct GetSeriesDetailResponse: Codable {
    
    let id: Int
    let name: String
    let genres: [String]
    let schedule: Schedule?
    let image: Image?
    let summary: String
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case id, name, genres, schedule, image, summary
        case embedded = "_embedded"
    }
}


struct Embedded: Codable {
    let episodes: [Episode]
}
