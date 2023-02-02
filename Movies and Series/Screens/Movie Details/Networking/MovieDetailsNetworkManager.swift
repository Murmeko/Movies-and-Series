//
//  MovieDetailsNetworkManager.swift
//  Movies and Series
//
//  Created by Murmeko on 31.10.2022.
//

import Moya

class MovieDetailsNetworkManager {
  let moviesDetailsAPIProvider = MoyaProvider<MovieDetailsAPI>()

  func requestMovieDetails(movieID: Int, completion: @escaping (MovieDetailsModel?) -> Void) {
    moviesDetailsAPIProvider.request(.getMovieDetails(movieID: movieID)) { result in
      switch result {
      case .success(let moyaResponse):
        do {
          debugPrint("URL: \(String(describing: moyaResponse.request?.url))")
          debugPrint("Status code: \(moyaResponse.statusCode)")
          _ = try moyaResponse.filterSuccessfulStatusCodes()
          let responseData = moyaResponse.data
          do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(MovieDetailsModel.self, from: responseData)
            completion(decodedData)
          } catch let decodingError {
            debugPrint("Error decoding Popular Movies data.")
            debugPrint(decodingError.localizedDescription)
            completion(nil)
          }
        } catch let filteringError {
          debugPrint("Error filtering Popular Movies data.")
          debugPrint(filteringError.localizedDescription)
          completion(nil)
        }
      case .failure(let moyaError):
        debugPrint("Error fetching Popular Movies data.")
        debugPrint(moyaError.localizedDescription)
        completion(nil)
      }
    }
  }
}
