//
//  PopularSeriesCollectionViewController.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 14.06.2021.
//

import UIKit

class PopularSeriesCollectionViewController: UICollectionViewController {
    
    @IBOutlet var seriesCollectionView: UICollectionView!
    
    var seriesGenresManager = GenresManager()
    var genres: [GenresModel] = []
    var seriesManager = SeriesManager()
    var series: [PopularSeriesModel] = []
    var seriesDetails: SeriesDetailsModel? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        seriesGenresManager.delegate = self
        seriesGenresManager.getGenres()
        self.title = "Popular Series"
        seriesManager.delegate = self
        seriesManager.getPopularSeries()
        seriesCollectionView.register(UINib(nibName: "SeriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReuseableSeriesCell")
        if let layout = seriesCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 400)
                layout.itemSize = size
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let series = series[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReuseableSeriesCell", for: indexPath) as! SeriesCollectionViewCell
        
        cell.seriesTitleLabel.text = series.title
        cell.seriesRatingLabel.text = series.rating
        cell.seriesCoverImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(series.coverPath)"))
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        seriesManager.getSeriesDetails(seriesID: series[indexPath.row].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! SeriesDetailsTableViewController
        destinationViewController.titleSeriesDetailsText = seriesDetails!.title
        destinationViewController.dateSeriesDetailsText = seriesDetails!.date
        destinationViewController.ratingSeriesDetailsText = seriesDetails!.rating
        destinationViewController.overviewSeriesDetailsText = seriesDetails!.overview
        destinationViewController.coverSeriesDetailsPath = seriesDetails!.coverPath
        destinationViewController.durationSeriesDetailsText = seriesDetails!.duration
        destinationViewController.genresSeriesDetailsText = seriesDetails!.genre
    }
}

extension PopularSeriesCollectionViewController: GenresManagerDelegate {
    func didGetGenres(data: GenresData) {
        let genreCount = data.genres?.count
        for genreNumber in 0...(genreCount!-1) {
            let newGenre = GenresModel(id: data.genres![genreNumber].id!, name: data.genres![genreNumber].name!)
            self.genres.append(newGenre)
        }
    }
}

extension PopularSeriesCollectionViewController: SeriesManagerDelegate {
    func didGetPopularSeries(data: PopularSeriesData) {
        let seriesCount = (data.results?.count)!
        var genreNames: [String] = []
        for seriesNumber in 0...(seriesCount-1) {
            let genreCount = genres.count
            for genreNumber in 0...(genreCount-1) {
                let genreIdDataCount = (data.results![seriesNumber].genreIds?.count)!
                for genreIdNumber in 0...(genreIdDataCount-1) {
                    if genres[genreNumber].id == data.results![seriesNumber].genreIds![genreIdNumber] {
                        genreNames.append(genres[genreNumber].name)
                    }
                }
            }
            let newSeries = PopularSeriesModel(id: data.results![seriesNumber].id!, title: data.results![seriesNumber].name!, genre: (genreNames.joined(separator: ", ")), rating: String(data.results![seriesNumber].voteAverage!), coverPath: data.results![seriesNumber].posterPath!)
            self.series.append(newSeries)
        }
        self.seriesCollectionView.reloadData()
    }
    
    func didGetSeriesDetails(data: SeriesDetailsData) {
        var genreNames: [String] = []
        let genreCount = genres.count
        for genreNumber in 0...(genreCount-1) {
            let genreIdDataCount = (data.genres?.count)!
            for genreIdNumber in 0...(genreIdDataCount-1) {
                if genres[genreNumber].id == data.genres![genreIdNumber].id {
                    genreNames.append(genres[genreNumber].name)
                }
            }
        }
        let stringDate = data.firstAirDate!
        let formatter0 = DateFormatter()
        formatter0.dateFormat = "yyyy-mm-dd"
        let unformattedDate = formatter0.date(from: stringDate)
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd.mm.yyyy"
        self.seriesDetails = SeriesDetailsModel(id: data.id!, coverPath: data.posterPath!, title: data.name!, genre: genreNames.joined(separator: ", "), rating: String(data.voteAverage!), date: (formatter1.string(from: unformattedDate!)), duration: data.episodeRunTime![0], overview: data.overview!)
        genreNames = []
        
        self.performSegue(withIdentifier: "seriesToSeriesDetailsSegue", sender: self)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
