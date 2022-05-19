//
//  SeriesSeasonHeaderViewCell.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import UIKit


class SeriesSeasonHeaderViewCell: ConfigurableTableViewHeaderFooterView {
    var model: Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel?.numberOfLines = 0
        self.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    func config(object: Int) {
        self.textLabel?.text = "Season \(object)"
    }
}
