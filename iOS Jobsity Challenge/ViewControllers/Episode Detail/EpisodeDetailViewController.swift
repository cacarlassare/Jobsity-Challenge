//
//  EpisodeDetailViewController.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import UIKit


class EpisodeDetailViewController: UIViewController, Configurable {
    
    var model: Episode?
    private var episode: Episode!
    @IBOutlet private weak var episodeDetailView: EpisodeDetailView!
    
    
    func config(object: Episode) {
        self.episode = object
    }
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.episodeDetailView.config(object: self.episode)
    }
}
