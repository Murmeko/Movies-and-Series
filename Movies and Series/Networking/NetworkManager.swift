//
//  NetworkManager.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 4.12.2021.
//

import Foundation
import Moya

class NetworkManager {
    let provider = MoyaProvider<TmdbApi>()
}

extension NetworkManager {
    func decodeResponse<T: Codable>(type: T.Type, response: Response, completion: @escaping (Codable?) -> Void) {
        let decoder = JSONDecoder()
        do {
            let decodedResponse = try decoder.decode(type.self, from: response.data)
            completion(decodedResponse)
        } catch let decodingError {
            print("Error decoding response: \(decodingError)")
            completion(nil)
        }
    }
    
    func fetchMovieData(type: ApiMethod, completion: @escaping (Codable?) -> Void) {
        provider.request(.init(apiMethod: type)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    switch type {
                    case .popularMovies, .upcomingMovies, .topRatedMovies, .movieDetails:
                        self.decodeResponse(type: MoviesModel.self, response: filteredResponse) { decodedResponse in
                            completion(decodedResponse)
                        }
                    case .movieGenres:
                        completion(nil)
                    }
                } catch let filteringError {
                    print("Error filtering response: \(filteringError)")
                    completion(nil)
                }
            case .failure(let moyaError):
                print("Error fetching data: \(moyaError)")
                completion(nil)
            }
        }
    }
}
