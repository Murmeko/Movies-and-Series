//
//  GenresManager.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 15.06.2021.
//

import Alamofire

protocol GenresManagerDelegate {
    func didGetGenres(data: GenresData)
    func didFailWithError(error: Error)
}

struct GenresManager {
    
    var delegate: GenresManagerDelegate?
    
    let baseURL = "https://api.themoviedb.org/3"
    let apiKey = "b6650ec7332a29feb575cdf90c6985fd"
    
    func getGenres() {
        
        let getGenreURL = "\(baseURL)/genre/movie/list?api_key=\(apiKey)&language=en-US"
        
        AF.request(getGenreURL, method: .get)
            .responseJSON { response in
            switch response.result {
            case .success(let data):
                let genresData = GenresData(JSON: data as! [String : Any])
                self.delegate!.didGetGenres(data: genresData!)
            case .failure(let error):
                self.delegate!.didFailWithError(error: error)
            }
        }
    }
}
