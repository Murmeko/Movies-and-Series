//
//  MovieDetailViewController.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 13.06.2021.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieDetailsTableView: UITableView!
    
    var titleDetailText: String = ""
    var genresDetailText: String = ""
    var dateDetailText: String = ""
    var ratingDetailText: String = ""
    var durationDetailText: Int = 0
    var summaryDetailText: String = ""
    var coverDetailPath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDetailsTableView.register(UINib.init(nibName: "MovieDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReuseableMovieDetailsCell")
        movieDetailsTableView.dataSource = self
    }
}

extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableMovieDetailsCell", for: indexPath) as! MovieDetailsTableViewCell
        
        cell.titleDetailLabel.text = self.titleDetailText
        cell.dateDetailLabel.text = self.dateDetailText
        cell.ratingDetailLabel.text = self.ratingDetailText
        cell.overviewDetailLabel.text = self.summaryDetailText
        cell.genresDetailLabel.text = self.genresDetailText
        cell.durationDetailLabel.text = "\(self.durationDetailText) min."
        cell.overviewLabel.text = "Overview"
        cell.coverDetailImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(self.coverDetailPath)"))
        
        return cell
    }
    
    
}
