//
//  SeriesDetailViewController.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import UIKit


class SeriesDetailTableViewController: UITableViewController, Configurable {
    
    var model: Series?
    private var series: Series!
    private var viewModel: SeriesDetailViewModel = SeriesDetailViewModel()
    private var selectedEpisode: Episode?
    
    
    func config(object: Series) {
        self.series = object
    }
    
    
    // Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.setupTableView()
        
        self.getEpisodes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EpisodeDetailSegue", let destinationVC = segue.destination as? EpisodeDetailViewController, let selectedEpisode = self.selectedEpisode {
            destinationVC.config(object: selectedEpisode)
        }
    }
    
    // Methods
    private func setupTableView() {
        let seriesDetailTableViewCellNib = UINib(nibName: "SeriesDetailTableViewCell", bundle: nil)
        self.tableView.register(seriesDetailTableViewCellNib, forCellReuseIdentifier: "SeriesDetailTableViewCell")
        
        let seriesSeasonHeaderViewCell = UINib(nibName: "SeriesSeasonHeaderViewCell", bundle: nil)
        self.tableView.register(seriesSeasonHeaderViewCell, forHeaderFooterViewReuseIdentifier: "SeriesSeasonHeaderViewCell")
        
        let seriesEpisodeTableViewCellNib = UINib(nibName: "SeriesEpisodesTableViewCell", bundle: nil)
        self.tableView.register(seriesEpisodeTableViewCellNib, forCellReuseIdentifier: "SeriesEpisodesTableViewCell")
    }
    
    private func getEpisodes() {
        self.showLoading()
        
        Task(priority: .background) {
            await self.viewModel.loadEpisodes(series: self.series)
        }
    }
}


// ViewModel
extension SeriesDetailTableViewController: ViewModelDelegate {
    
    func updateWithResults<ResultType>(result: ResultType) {
        DispatchQueue.main.async { [weak self] in
            self?.dismissLoading()
            self?.tableView.reloadData()
        }
    }
    
    func handleError(error: LocalizedError?) {
        DispatchQueue.main.async { [weak self] in
            self?.dismissLoading()
            self?.showErrorAlert(message: error?.localizedDescription ?? RequestError.unknown.localizedDescription)
        }
    }
}


// TableView Delegate & Datasource
extension SeriesDetailTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.episodesBySeason.count + 1 // for the Detail
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        
        var headerView: UITableViewHeaderFooterView? = nil
        
        if let dequeuedHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SeriesSeasonHeaderViewCell") as? SeriesSeasonHeaderViewCell {
            dequeuedHeaderView.config(object: section)
            
            headerView = dequeuedHeaderView
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1 // Detail cell
            default:
                return self.viewModel.episodesBySeason[section]!.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        switch indexPath.section {
            case 0:
                let dequeuedReusableCell = tableView.dequeueReusableCell(withIdentifier: "SeriesDetailTableViewCell", for: indexPath) as! SeriesDetailTableViewCell
                
                dequeuedReusableCell.config(object: self.series!)
                
                cell = dequeuedReusableCell
                
            default:
                let dequeuedReusableCell = tableView.dequeueReusableCell(withIdentifier: "SeriesEpisodesTableViewCell", for: indexPath) as! SeriesEpisodesTableViewCell
                
                if let episode = self.viewModel.episodesBySeason[indexPath.section]?[indexPath.row] {
                    dequeuedReusableCell.config(object: episode)
                }
                
                cell = dequeuedReusableCell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            case 0:
                tableView.deselectRow(at: indexPath, animated: false)
                
            default:
                if let episode = self.viewModel.episodesBySeason[indexPath.section]?[indexPath.row] {
                    self.selectedEpisode = episode
                    self.performSegue(withIdentifier: "EpisodeDetailSegue", sender: nil)
                }
                
                tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
