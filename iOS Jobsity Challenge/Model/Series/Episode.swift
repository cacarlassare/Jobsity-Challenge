//
//  Episode.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 17/05/2022.
//

import Foundation


struct Episode: Codable {
    
    let id: Int
    let name: String
    let season, number: Int
    let image: Image?
    let summary: String?

    enum CodingKeys: String, CodingKey {
        case id, name, season, number, image, summary
    }
}
