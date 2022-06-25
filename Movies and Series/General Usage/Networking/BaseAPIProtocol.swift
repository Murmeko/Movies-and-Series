//
//  BaseAPIProtocol.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import Moya

protocol BaseAPIProtocol {
	var generalAPIKey: String { get }
	var baseURL: URL { get }
}

extension BaseAPIProtocol {
	var generalAPIKey: String {
		return Constants.generalAPIKey
	}
	var baseURL: URL {
    return URL(string: Constants.baseUrlString)!
	}
}
