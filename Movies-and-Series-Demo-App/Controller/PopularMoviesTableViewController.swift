//
//  PopularMoviesTableViewController.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import UIKit
import Kingfisher

class PopularMoviesTableViewController: UITableViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var moviesGenresManager = GenresManager()
    var genres: [GenresModel] = []
    var moviesManager = MoviesManager()
    var movies: [PopularMoviesModel] = []
    var movieDetails: MovieDetailsModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesGenresManager.delegate = self
        moviesGenresManager.getGenres()
        self.title = "Popular Movies"
        moviesManager.delegate = self
        moviesManager.getPopularMovies()
        moviesTableView.register(UINib.init(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "ReuseableMoviesCell")
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableMoviesCell", for: indexPath) as! MoviesTableViewCell
        
        cell.titleLabel.text = movie.title
        cell.genreLabel.text = movie.genre
        cell.dateLabel.text = movie.date
        cell.ratingLabel.text = movie.rating
        cell.coverImageView.kf.setImage(with: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(movie.coverPath)"))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesManager.getMovieDetail(movieID: movies[indexPath.row].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! MovieDetailsTableViewController
        destinationViewController.titleDetailText = movieDetails!.title
        destinationViewController.dateDetailText = movieDetails!.date
        destinationViewController.ratingDetailText = movieDetails!.rating
        destinationViewController.summaryDetailText = movieDetails!.summary
        destinationViewController.coverDetailPath = movieDetails!.coverPath
        destinationViewController.durationDetailText = movieDetails!.duration
        destinationViewController.genresDetailText = movieDetails!.genre
    }
}

extension PopularMoviesTableViewController: GenresManagerDelegate {
    func didGetGenres(data: GenresData) {
        let genreCount = data.genres?.count
        for genreNumber in 0...(genreCount!-1) {
            let newGenre = GenresModel(id: data.genres![genreNumber].id!, name: data.genres![genreNumber].name!)
            self.genres.append(newGenre)
        }
    }
}

extension PopularMoviesTableViewController: MoviesManagerDelegate {
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
            let stringDate = data.results![movieNumber].releaseDate!
            let formatter0 = DateFormatter()
            formatter0.dateFormat = "yyyy-mm-dd"
            let unformattedDate = formatter0.date(from: stringDate)
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "dd.mm.yyyy"
            let newMovie = PopularMoviesModel(title: data.results![movieNumber].title!, genre: (genreNames.joined(separator: ", ")), date: (formatter1.string(from: unformattedDate!)), rating: String(data.results![movieNumber].voteAverage!), id: data.results![movieNumber].id!, coverPath: data.results![movieNumber].posterPath!)
            self.movies.append(newMovie)
            genreNames = []
            
        }
        self.moviesTableView.reloadData()
    }
    
    func didGetMovieDetails(data: MovieDetailsData) {
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
        let stringDate = data.releaseDate!
        let formatter0 = DateFormatter()
        formatter0.dateFormat = "yyyy-mm-dd"
        let unformattedDate = formatter0.date(from: stringDate)
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd.mm.yyyy"
        self.movieDetails = MovieDetailsModel(title: data.title!, genre: genreNames.joined(separator: ", "), date: (formatter1.string(from: unformattedDate!)), rating: String(data.voteAverage!), id: data.id!, duration: data.runtime!, summary: data.overview!, coverPath: data.posterPath!)
        genreNames = []
        
        self.performSegue(withIdentifier: "moviesToMovieDetailsSegue", sender: self)
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}
