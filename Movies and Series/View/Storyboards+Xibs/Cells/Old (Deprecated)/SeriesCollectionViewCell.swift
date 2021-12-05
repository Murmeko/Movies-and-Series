//
//  SeriesCollectionViewCell.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 14.06.2021.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var seriesCellView: UIView!
    @IBOutlet weak var seriesCoverImageView: UIImageView!
    @IBOutlet weak var seriesTitleLabel: UILabel!
    @IBOutlet weak var seriesRatingView: UIView!
    @IBOutlet weak var seriesRatingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        seriesCoverImageView.layer.cornerRadius = self.frame.height / 45
        seriesRatingView.layer.cornerRadius = 15
    }
}
