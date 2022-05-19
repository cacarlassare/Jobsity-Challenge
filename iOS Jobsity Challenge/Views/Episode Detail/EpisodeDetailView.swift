//
//  EpisodeDetailView.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import UIKit


class EpisodeDetailView: UIView, Configurable {
    var model: Episode?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var seasonLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    
    
    func config(object: Episode) {
        self.nameLabel.text = object.name
        self.posterImageView.load(url: object.image?.original ?? "", placeholder: UIImage(named: "ImagePlaceholder"))
        self.numberLabel.text = "Episode nº \n\(object.number)"
        self.seasonLabel.text = "Season nº \n\(object.season)"
        
        if let summary = object.summary, !summary.isEmpty {
            self.summaryLabel.text = "Summary:\(summary.withoutHTMLTags)"
        } else {
            self.summaryLabel.text = "No summary info"
        }
    }
}
