//
//  SeriesDetailTableViewCell.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import UIKit
import WebKit


class SeriesDetailTableViewCell: ConfigurableTableViewCell {
    var model: Series?
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var scheduleLabel: UILabel!
    @IBOutlet private weak var genresLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var episodiesTitleLabel: UILabel!
    
    
    func config(object: Series) {
        self.titleLabel.text = object.name
        self.posterImageView.load(url: object.image?.original ?? "", placeholder: UIImage(named: "ImagePlaceholder"))
        
        if let schedule = object.schedule, !schedule.time.isEmpty, !schedule.days.isEmpty {
            let time = schedule.time
            let days = schedule.days.joined(separator: ", ")
            self.scheduleLabel.text = "\(days)\n\(time)"
        } else {
            self.scheduleLabel.text = "No scheduling info"
        }
        
        if let genres = object.genres, !genres.isEmpty {
            self.genresLabel.text = "Genres:\n\(genres.joined(separator: ", "))"
        } else {
            self.genresLabel.text = "No genres info"
        }
        
        if let summary = object.summary, !summary.isEmpty {
            self.summaryLabel.text = "Summary:\(summary.withoutHTMLTags)"
        } else {
            self.summaryLabel.text = "No summary info"
        }

        self.episodiesTitleLabel.text = "Episodies"
    }
}
