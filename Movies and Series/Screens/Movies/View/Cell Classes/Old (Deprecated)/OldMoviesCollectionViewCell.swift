//
//  OldMoviesCollectionViewCell.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 7.12.2021.
//

import UIKit
import Kingfisher

class OldMoviesCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var ratingView: UIView!
	override func awakeFromNib() {
		super.awakeFromNib()
		imageView.layer.cornerRadius = 10
		ratingView.layer.cornerRadius = ratingView.frame.height / 2
		imageView.kf.setImage(with: ImageResource(downloadURL: URL(string: "https://www.themoviedb.org/t/p/w1280/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg")!))
		imageView.contentMode = .scaleAspectFill
	}
}
