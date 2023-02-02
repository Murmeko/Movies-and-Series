//
//  MovieDetailsAPI.swift
//  Movies and Series
//
//  Created by Murmeko on 31.10.2022.
//

import Moya

enum MovieDetailsAPI {
  case getMovieDetails(movieID: Int)
}

extension MovieDetailsAPI: BaseAPIProtocol, TargetType {
  var path: String {
    switch self {
    case .getMovieDetails(movieID: let movieID):
      return "/movie/\(movieID)"
    }
  }

  var method: Method {
    switch self {
    case .getMovieDetails:
      return .get
    }
  }

  var task: Task {
    var parameters: [String: Any] = [:]
    parameters[ParameterKeys.apiKey.rawValue] = generalAPIKey
    switch self {
    case .getMovieDetails:
      return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
  }

  var headers: [String : String]? {
    return .none
  }
}

extension MovieDetailsAPI {
  enum ParameterKeys: String {
    case apiKey = "api_key"
    case page
  }
}
