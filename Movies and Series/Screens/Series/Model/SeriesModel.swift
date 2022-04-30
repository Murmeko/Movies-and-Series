//
//  SeriesModel.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import Foundation

// MARK: - SeriesModel
struct SeriesModel: Codable {
	var page: Int?
	var results: [SeriesResult]?
	var totalPages: Int?
	var totalResults: Int?

	enum CodingKeys: String, CodingKey {
		case page = "page"
		case results = "results"
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}
