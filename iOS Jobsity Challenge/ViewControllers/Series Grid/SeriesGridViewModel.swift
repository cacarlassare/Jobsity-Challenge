//
//  SeriesGridViewModel.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


class SeriesGridViewModel {
    
    var allSeriesResults: Array<Series> = []
    var hasMoreSeries: Bool = true
    weak var delegate: ViewModelDelegate?
    private var searchedName: String = ""
    
    
    func loadSeries() async {
        self.allSeriesResults.removeAll()
        
        let (series, error) = await GetSeriesClient.getSeries()
        
        if let newSeries = series {
            if !newSeries.isEmpty {
                self.allSeriesResults.append(contentsOf: newSeries)
                self.hasMoreSeries = true
            } else {
                self.hasMoreSeries = false
            }
            
            self.delegate?.updateWithResults(result: self.allSeriesResults)
        } else {
            self.hasMoreSeries = false
            self.delegate?.handleError(error: error)
        }
    }
    
    func searchSeries(name: String? = nil) async {
        if name != self.searchedName {
            self.allSeriesResults.removeAll()
        }
        
        self.searchedName = name ?? ""
        
        let (series, error) = await GetSeriesClient.getSearchedSeries(name: self.searchedName)
        
        if let newSeries = series {
            if !newSeries.isEmpty {
                let seriesFromResults = GetSearchedSeriesResponseContent.arrayOfSeries(responses: newSeries)
                self.allSeriesResults.append(contentsOf: seriesFromResults)
                self.hasMoreSeries = true
            } else {
                self.hasMoreSeries = false
            }
            
            self.delegate?.updateWithResults(result: self.allSeriesResults)
        } else {
            self.hasMoreSeries = false
            self.delegate?.handleError(error: error)
        }
    }
}
