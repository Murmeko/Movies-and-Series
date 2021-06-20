//
//  PopularSeriesDetailsTableViewController.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 14.06.2021.
//

import UIKit

class SeriesDetailsTableViewController: UITableViewController {
    
    @IBOutlet var seriesDetailsTableView: UITableView!
    
    var titleSeriesDetailsText: String = ""
    var genresSeriesDetailsText: String = ""
    var dateSeriesDetailsText: String = ""
    var ratingSeriesDetailsText: String = ""
    var durationSeriesDetailsText: Int = 0
    var overviewSeriesDetailsText: String = ""
    var coverSeriesDetailsPath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Series Details"
        seriesDetailsTableView.register(UINib(nibName: "SeriesDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReuseableSeriesDetailsCell")
        seriesDetailsTableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableSeriesDetailsCell", for: indexPath) as! SeriesDetailsTableViewCell
        
        cell.seriesDetailsCoverImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(self.coverSeriesDetailsPath)"))
        cell.seriesDetailsTitleLabel.text = self.titleSeriesDetailsText
        cell.seriesDetailsDateLabel.text = self.dateSeriesDetailsText
        cell.seriesDetailsRatingLabel.text = self.ratingSeriesDetailsText
        cell.seriesDetailsOverviewLabel.text = self.overviewSeriesDetailsText
        cell.seriesDetailsGenresLabel.text = self.genresSeriesDetailsText
        cell.seriesDetailsDurationLabel.text = "\(self.durationSeriesDetailsText) min"
        
        return cell
    }
}
