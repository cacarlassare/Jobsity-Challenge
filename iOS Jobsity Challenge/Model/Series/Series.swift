//
//  Series.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 17/05/2022.
//

import Foundation


struct Series: Codable {
    let id: Int
    let name: String?
    let genres: [String]?
    let schedule: Schedule?
    let image: Image?
    let summary: String?
    
    
    static func fromContent(series: Series) -> Series {
        let newSeries = Series(id: series.id, name: series.name, genres: series.genres, schedule: series.schedule, image: series.image, summary: series.summary)
        
        return newSeries
    }
}


struct Image: Codable {
    let medium: String
    let original: String
}

struct Schedule: Codable {
    let time: String
    let days: [String]
}
