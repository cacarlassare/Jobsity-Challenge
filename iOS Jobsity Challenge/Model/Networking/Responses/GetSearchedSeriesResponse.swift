//
//  GetSearchedSeriesResponse.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import Foundation


typealias GetSearchedSeriesResponse = [GetSearchedSeriesResponseContent]


struct GetSearchedSeriesResponseContent: Codable {
    
    let content: Series

    enum CodingKeys: String, CodingKey {
        case content = "show"
    }
    
    
    func toSeries() -> Series {
        Series.fromContent(series: self.content)
    }
    
    static func arrayOfSeries(responses: [GetSearchedSeriesResponseContent]) -> [Series] {
        var newArrayOfSeries = [Series]()
        
        for response in responses {
            let newSeries = response.toSeries()
            newArrayOfSeries.append(newSeries)
        }
        
        return newArrayOfSeries
    }
}
