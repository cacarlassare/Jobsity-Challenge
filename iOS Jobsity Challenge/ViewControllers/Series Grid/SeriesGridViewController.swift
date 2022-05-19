//
//  ViewController.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 17/05/2022.
//

import UIKit


class SeriesGridViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private var viewModel: SeriesGridViewModel = SeriesGridViewModel()
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchBar.delegate = self
        sc.searchBar.placeholder = "Enter a Series title"
        return sc
    } ()
    
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavBar()
        self.setupCollectionView()
        
        self.viewModel.delegate = self
        self.loadSeries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SeriesDetailSegue", let destinationVC = segue.destination as? SeriesDetailTableViewController, let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                let selectedSeries = self.viewModel.allSeriesResults[indexPath.row]
                destinationVC.config(object: selectedSeries)
        }
    }
    
    // Methods
    private func setupNavBar() {
        self.navigationItem.searchController = self.searchController
        self.definesPresentationContext = true
    }
    
    private func setupCollectionView() {
        let seriesCollectionViewCellNib = UINib(nibName: "SeriesCollectionViewCell", bundle: nil)
        self.collectionView.register(seriesCollectionViewCellNib, forCellWithReuseIdentifier: "SeriesCollectionViewCell")
    }
    
    private func loadSeries(name: String? = nil) {
        self.showLoading()
        
        Task(priority: .background) {
            if let name = name {
                await self.viewModel.searchSeries(name: name)
            } else {
                await self.viewModel.loadSeries()
            }
        }
    }
}


// ViewModel
extension SeriesGridViewController: ViewModelDelegate {
    
    func updateWithResults<ResultType>(result: ResultType) {
        DispatchQueue.main.async { [weak self] in
            self?.dismissLoading()
            self?.collectionView.reloadData()
        }
    }
    
    func handleError(error: LocalizedError?) {
        DispatchQueue.main.async { [weak self] in
            self?.dismissLoading()
            self?.collectionView.reloadData()
            self?.showErrorAlert(message: error?.localizedDescription ?? RequestError.unknown.localizedDescription)
        }
    }
}


// CollectionView
extension SeriesGridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.allSeriesResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeriesCollectionViewCell", for: indexPath) as? SeriesCollectionViewCell {
            cell.config(object: self.viewModel.allSeriesResults[indexPath.row])
            return cell
        }
        
        return SeriesCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SeriesDetailSegue", sender: nil)
        
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    // CollectionView Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let margins = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let size = (collectionView.frame.size.width - margins) / 2.0
        
        return CGSize(width: size, height: size * (collectionView.frame.size.height / collectionView.frame.size.width))
    }
}


// Search
extension SeriesGridViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.loadSeries(name: self.searchController.searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.loadSeries()
    }
 }
