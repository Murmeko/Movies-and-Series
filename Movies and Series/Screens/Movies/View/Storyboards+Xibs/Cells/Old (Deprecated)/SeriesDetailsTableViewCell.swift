//
//  SeriesDetailsTableViewCell.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 14.06.2021.
//

import UIKit

class SeriesDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var seriesDetailsCellView: UIView!
    @IBOutlet weak var seriesDetailsCoverImageView: UIImageView!
    @IBOutlet weak var seriesDetailsTitleLabel: UILabel!
    @IBOutlet weak var seriesDetailsGenresLabel: UILabel!
    @IBOutlet weak var seriesDetailsRatingView: UIView!
    @IBOutlet weak var seriesDetailsRatingLabel: UILabel!
    @IBOutlet weak var seriesDetailsDurationLabel: UILabel!
    @IBOutlet weak var seriesDetailsDateLabel: UILabel!
    @IBOutlet weak var seriesDetailsOverviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        seriesDetailsRatingView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
