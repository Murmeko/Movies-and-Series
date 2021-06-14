//
//  DataManager.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import Alamofire
import Kingfisher

protocol MovieManagerDelegate {
    func didGetPopularMovies(data: PopularMoviesData)
    func didGetMovieDetail(data: MovieDetailData)
    func didGetGenre(data: MovieGenreData)
    func didFailWithError(error: Error)
}

struct MovieManager {
    
    var delegate: MovieManagerDelegate?
    
    let baseURL = "https://api.themoviedb.org/3"
    let apiKey = "b6650ec7332a29feb575cdf90c6985fd"
    
    func getPopularMovies() {
        
        let getPopularMoviesURL = "\(baseURL)/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        
        AF.request(getPopularMoviesURL, method: .get)
            .responseJSON { response in
            switch response.result {
            case .success(let data):
                let popularMoviesData = PopularMoviesData(JSON: data as! [String : Any])
                self.delegate?.didGetPopularMovies(data: popularMoviesData!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getMovieDetail(movieID: Int) {
        
        let getMovieDetailURL = "\(baseURL)/movie/\(movieID)?api_key=\(apiKey)&language=en-US"
        
        AF.request(getMovieDetailURL, method: .get)
            .responseJSON { response in
            switch response.result {
            case .success(let data):
                let movieDetailData = MovieDetailData(JSON: data as! [String : Any])
                self.delegate!.didGetMovieDetail(data: movieDetailData!)
            case .failure(let error):
                self.delegate!.didFailWithError(error: error)
            }
        }
    }
    
    func getGenres() {
        
        let getGenreURL = "\(baseURL)/genre/movie/list?api_key=\(apiKey)&language=en-US"
        
        AF.request(getGenreURL, method: .get)
            .responseJSON { response in
            switch response.result {
            case .success(let data):
                let genreData = MovieGenreData(JSON: data as! [String : Any])
                self.delegate!.didGetGenre(data: genreData!)
            case .failure(let error):
                self.delegate!.didFailWithError(error: error)
            }
        }
    }
}
