//
//  GetSeriesClient.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


struct GetSeriesClient: NetworkClient {
    
    static func getSeries() async -> (GetSeriesResponse?, LocalizedError?) {
        let endpoint = GetSeriesEndpoint()
        let result = await self.sendRequest(endpoint: endpoint, responseType: GetSeriesResponse.self)
        
        switch result {
            case .success(let seriesResponse):
                return (seriesResponse, nil)
            case .failure(let requestError):
                return (nil, requestError)
        }
    }
    
    static func getSearchedSeries(name: String? = nil) async -> (GetSearchedSeriesResponse?, LocalizedError?) {
        var endpoint: Endpoint
        
        guard let nonOptName = name, !nonOptName.isEmpty else {
            return (nil, nil)
        }
        
        let parameters = ["q" : nonOptName]
        endpoint = GetSearchedSeriesEndpoint(parameters: parameters)
        
        let result = await self.sendRequest(endpoint: endpoint, responseType: GetSearchedSeriesResponse.self)
        
        switch result {
            case .success(let searchedSeriesResponse):
                return (searchedSeriesResponse, nil)
            case .failure(let requestError):
                return (nil, requestError)
        }
    }
}
