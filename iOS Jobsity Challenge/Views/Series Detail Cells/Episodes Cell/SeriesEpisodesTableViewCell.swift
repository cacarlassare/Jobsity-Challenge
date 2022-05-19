//
//  SeriesEpisodesTableViewCell.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import UIKit


class SeriesEpisodesTableViewCell: ConfigurableTableViewCell {
    var model: Episode?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel?.numberOfLines = 0
        self.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    
    func config(object: Episode) {
        self.textLabel?.text = "  \(object.name)"
    }
}
