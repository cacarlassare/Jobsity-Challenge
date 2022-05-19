//
//  SeriesCollectionViewCell.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import UIKit


class SeriesCollectionViewCell: UICollectionViewCell, Configurable {
    var model: Series?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    
    
    func config(object: Series) {
        self.nameLabel.text = object.name
        self.posterImageView.load(url: object.image?.medium ?? "", placeholder: UIImage(named: "ImagePlaceholder"))
    }
}
