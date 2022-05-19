//
//  GetEpisodesClient.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import Foundation


struct GetSeriesDetailClient: NetworkClient {
    
    static func getEpisodes(seriesID: Int) async -> (GetSeriesDetailResponse?, LocalizedError?) {
        let endpoint = GetEpisodesEndpoint(seriesID: seriesID)
        let result = await self.sendRequest(endpoint: endpoint, responseType: GetSeriesDetailResponse.self)
        
        switch result {
            case .success(let seriesResponse):
                return (seriesResponse, nil)
            case .failure(let requestError):
                return (nil, requestError)
        }
    }
}
