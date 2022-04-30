//
//  MoviesAPI.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import Moya

enum MoviesAPI {
	case getPopular(page: Int)
}

extension MoviesAPI: BaseAPIProtocol, TargetType {
	var path: String {
		switch self {
		case .getPopular:
			return "/movie/popular"
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
			parameters[ParameterKeys.apiKey.rawValue] = page
			return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
		}
	}

	var headers: [String : String]? {
		return .none
	}
}

extension MoviesAPI {
	enum ParameterKeys: String {
		case apiKey = "api_key"
		case page
	}
}
