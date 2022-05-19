//
//  SeriesDetailViewModel.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


class SeriesDetailViewModel {
    
    weak var delegate: ViewModelDelegate?
    var episodesBySeason: [Int : [Episode]] = [:]
    
    
    func loadEpisodes(series: Series) async {
        let seriesID = series.id
        
        let (episodes, error) = await GetSeriesDetailClient.getEpisodes(seriesID: seriesID)
        if let episodes = episodes {
            self.splitEpisodesBySeason(episodes: episodes.embedded.episodes)
            self.delegate?.updateWithResults(result: self.episodesBySeason)
        } else {
            self.delegate?.handleError(error: error)
        }
    }
    
    private func splitEpisodesBySeason(episodes: [Episode]) {
        for episode in episodes {
            if self.episodesBySeason[episode.season] == nil {
                self.episodesBySeason[episode.season] = []
            }
            
            self.episodesBySeason[episode.season]?.append(contentsOf: CollectionOfOne(episode))
        }
    }
}
