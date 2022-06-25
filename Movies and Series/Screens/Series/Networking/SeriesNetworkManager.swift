//
//  SeriesNetworkManager.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import Moya

class SeriesNetworkManager {
  let seriesApiProvider = MoyaProvider<SeriesAPI>()

  func requestPopularSeries(page: Int, completion: @escaping (SeriesModel?) -> Void) {
    seriesApiProvider.request(.getPopular(page: page)) { result in
      switch result {
      case .success(let moyaResponse):
        do {
          debugPrint("URL: \(String(describing: moyaResponse.request?.url))")
          debugPrint("Status code: \(moyaResponse.statusCode)")
          _ = try moyaResponse.filterSuccessfulStatusCodes()
          let responseData = moyaResponse.data
          do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(SeriesModel.self, from: responseData)
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