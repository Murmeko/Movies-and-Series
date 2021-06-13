//
//  ViewController.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import UIKit
import Alamofire
import Kingfisher

class PopularMoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieManager = MoviesManager()
    var movies: [PopularMoviesModel] = []
    var coverImages: [KFImage] = []
    var genres: [MovieGenreModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieManager.delegate = self
        movieManager.getGenres()
        movieManager.getPopularMovies()
        tableView.register(UINib.init(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "ReuseableCell")
        tableView.dataSource = self
        
    }
}

extension PopularMoviesViewController: MoviesManagerDelegate {
    
    func didGetPopularMovies(data: PopularMoviesData) {
        let movieCount = data.results!.count
        var genreNames: [String] = []
        for movieNumber in 0...(movieCount-1) {
            let genreCount = genres.count
            for genreNumber in 0...(genreCount-1) {
                let genreIdDataCount = (data.results![movieNumber].genreIds?.count)!
                for genreIdNumber in 0...(genreIdDataCount-1) {
                    if genres[genreNumber].id == data.results![movieNumber].genreIds![genreIdNumber] {
                        genreNames.append(genres[genreNumber].name)
                    }
                }
            }
            let newMovie = PopularMoviesModel(title: data.results![movieNumber].title!, genre: (genreNames.joined(separator: ", ")), date: data.results![movieNumber].releaseDate!, rating: String(data.results![movieNumber].voteAverage!), id: data.results![movieNumber].id!, coverPath: data.results![movieNumber].posterPath!)
            self.movies.append(newMovie)
            genreNames = []
        }
        self.tableView.reloadData()
    }
    
    func didGetMovieDetail(data: MovieDetailData) {
        print(data)
    }
    
    func didGetGenre(data: MovieGenreData) {
        let genreCount = data.genres?.count
        for genreNumber in 0...(genreCount!-1) {
            let newGenre = MovieGenreModel(id: data.genres![genreNumber].id!, name: data.genres![genreNumber].name!)
            self.genres.append(newGenre)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

extension PopularMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableCell", for: indexPath) as! MovieTableViewCell
        
        cell.titleLabel.text = movie.title
        cell.genreLabel.text = movie.genre
        cell.dateLabel.text = movie.date
        cell.ratingLabel.text = movie.rating
        cell.coverImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(movie.coverPath)"))
        
        return cell
    }
}
