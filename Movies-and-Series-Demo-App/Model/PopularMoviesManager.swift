//
//  DataManager.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import Alamofire
import ObjectMapper

struct PopularMoviesManager {
    
    var listPopularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=b6650ec7332a29feb575cdf90c6985fd&language=en-US&page=1"
    
    func listPopularMovies() {
        
        AF.request(listPopularMoviesURL, method: .get)
            .responseJSON { response in
            switch response.result {
            case .success(let data):
                var popularMoviesData = PopularMoviesData(JSON: data as! [String : Any])
                print(popularMoviesData?.results![0].originalTitle!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
