//
//  SeriesManager.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 14.06.2021.
//

import Alamofire

protocol SeriesManagerDelegate {
    
    func didGetPopularSeries(data: PopularSeriesData)
    func didGetSeriesDetails(data: SeriesDetailsData)
    func didFailWithError(error: Error)
}

struct SeriesManager {
    
    var delegate: SeriesManagerDelegate?
    
    let baseURL = "https://api.themoviedb.org/3"
    let apiKey = "b6650ec7332a29feb575cdf90c6985fd"
    
    func getPopularSeries() {
        
        let getPopularSeriesURL = "\(baseURL)/tv/popular?api_key=\(apiKey)&language=en-US&page=1"
        
        AF.request(getPopularSeriesURL, method: .get)
            .responseJSON { response in
            switch response.result {
            case .success(let data):
                let popularSeriesData = PopularSeriesData(JSON: data as! [String : Any])
                self.delegate?.didGetPopularSeries(data: popularSeriesData!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSeriesDetails(seriesID: Int) {
        
        let getSeriesDetailsURL = "\(baseURL)/tv/\(seriesID)?api_key=\(apiKey)&language=en-US"
        
        AF.request(getSeriesDetailsURL, method: .get)
            .responseJSON { response in
            switch response.result {
            case .success(let data):
                let seriesDetailsData = SeriesDetailsData(JSON: data  as! [String : Any])
                self.delegate!.didGetSeriesDetails(data: seriesDetailsData!)
            case .failure(let error):
                self.delegate!.didFailWithError(error: error)
            }
        }
    }
}
