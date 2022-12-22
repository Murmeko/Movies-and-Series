//
//  MoviesModel.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 4.12.2021.
//

import Foundation

// MARK: - MoviesModel
struct MoviesModel: Codable {
	var page: Int?
	var results: [MoviesResult]?
	var totalPages: Int?
	var totalResults: Int?

  init(page: Int? = nil, results: [MoviesResult]? = nil, totalPages: Int? = nil, totalResults: Int? = nil) {
    self.page = page
    self.results = results
    self.totalPages = totalPages
    self.totalResults = totalResults
  }

	enum CodingKeys: String, CodingKey {
		case page = "page"
		case results = "results"
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}
