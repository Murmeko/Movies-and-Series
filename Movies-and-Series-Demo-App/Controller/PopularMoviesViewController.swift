//
//  ViewController.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import UIKit
import Kingfisher

class PopularMoviesViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var movieManager = MovieManager()
    var movies: [PopularMoviesModel] = []
    var coverImages: [KFImage] = []
    var genres: [MovieGenreModel] = []
    var movieDetails = MovieDetailModel(title: "", genre: "", date: "", rating: "", id: 0, duration: 0, summary: "", coverPath: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieManager.delegate = self
        movieManager.getGenres()
        movieManager.getPopularMovies()
        moviesTableView.register(UINib.init(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "ReuseableMovieCell")
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationViewController = segue.destination as! MovieDetailsViewController
        destinationViewController.titleDetailText = movieDetails.title
        destinationViewController.dateDetailText = movieDetails.date
        destinationViewController.ratingDetailText = movieDetails.rating
        destinationViewController.summaryDetailText = movieDetails.summary
        destinationViewController.coverDetailPath = movieDetails.coverPath
        destinationViewController.durationDetailText = movieDetails.duration
        destinationViewController.genresDetailText = movieDetails.genre
        
    }
}

extension PopularMoviesViewController: MovieManagerDelegate {
    
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
        
        self.moviesTableView.reloadData()
    }
    
    func didGetMovieDetail(data: MovieDetailData) {
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
        
        self.movieDetails = MovieDetailModel(title: data.title!, genre: genreNames.joined(separator: ", "), date: data.releaseDate!, rating: String(data.voteAverage!), id: data.id!, duration: data.runtime!, summary: data.overview!, coverPath: data.posterPath!)
        genreNames = []
        
        self.performSegue(withIdentifier: "moviesToDetailSegue", sender: self)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableMovieCell", for: indexPath) as! MoviesTableViewCell
        
        cell.titleLabel.text = movie.title
        cell.genreLabel.text = movie.genre
        cell.dateLabel.text = movie.date
        cell.ratingLabel.text = movie.rating
        cell.coverImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(movie.coverPath)"))
        
        return cell
    }
}

extension PopularMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieManager.getMovieDetail(movieID: movies[indexPath.row].id)
    }
}
