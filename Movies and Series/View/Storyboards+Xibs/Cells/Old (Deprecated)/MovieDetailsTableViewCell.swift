//
//  MovieDetailsTableViewCell.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 14.06.2021.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var movieDetailCellView: UIView!
    @IBOutlet weak var coverDetailImageView: UIImageView!
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var dateDetailLabel: UILabel!
    @IBOutlet weak var ratingDetailView: UIView!
    @IBOutlet weak var ratingDetailLabel: UILabel!
    @IBOutlet weak var genresDetailLabel: UILabel!
    @IBOutlet weak var durationDetailLabel: UILabel!
    @IBOutlet weak var overviewDetailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        ratingDetailView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
