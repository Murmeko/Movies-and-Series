//
//  SeriesAPI.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import Moya

enum SeriesAPI {
  case getPopular(page: Int)
}

extension SeriesAPI: BaseAPIProtocol, TargetType {
  var path: String {
    switch self {
    case .getPopular:
      return "/tv/popular"
    }
  }

  var method: Method {
    switch self {
    case .getPopular:
      return .get
    }
  }

  var task: Task {
    var parameters: [String: Any] = [:]
    parameters[ParameterKeys.apiKey.rawValue] = generalAPIKey
    switch self {
    case .getPopular(page: let page):
      parameters[ParameterKeys.page.rawValue] = page
      return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
  }

  var headers: [String : String]? {
    return .none
  }
}

extension SeriesAPI {
  enum ParameterKeys: String {
    case apiKey = "api_key"
    case page
  }
}
