//
//  BaseAPI.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import Moya

protocol BaseAPIProtocol {
	var baseURL: URL { get }
}

class BaseAPI: BaseAPIProtocol {
	var baseURL: URL {
		return URL(string: "https://api.themoviedb.org/3")!
	}
}
