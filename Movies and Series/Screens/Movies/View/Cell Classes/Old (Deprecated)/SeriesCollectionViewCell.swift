//
//  SeriesCollectionViewCell.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 14.06.2021.
//

import Kingfisher

class SeriesCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var seriesCellView: UIView!
	@IBOutlet weak var seriesCoverImageView: UIImageView!
	@IBOutlet weak var seriesTitleLabel: UILabel!
	@IBOutlet weak var seriesRatingView: UIView!
	@IBOutlet weak var seriesRatingLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		seriesCoverImageView.layer.cornerRadius = 10
		seriesRatingView.layer.cornerRadius = seriesRatingView.frame.height / 2
		seriesCoverImageView.kf.setImage(with: ImageResource(downloadURL: URL(string: "https://www.themoviedb.org/t/p/w1280/sGVCWtLG37mLOhl11qQVrjKsDzx.jpg")!))
		seriesCoverImageView.contentMode = .scaleAspectFill
		seriesTitleLabel.text = "Rick and Morty"
		seriesRatingLabel.text = "10.0"
	}
}
