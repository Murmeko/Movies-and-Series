//
//  MovieTableViewCell.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 13.06.2021.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var movieCellView: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coverImageView.layer.cornerRadius = self.frame.height / 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
