//
//  SeriesResult.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import Foundation

// MARK: - SeriesResult
struct SeriesResult: Codable {
	var backdropPath: String?
	var firstAirDate: String?
	var genreIds: [Int]?
	var id: Int?
	var name: String?
	var originCountry: [String]?
	var originalLanguage: String?
	var originalName: String?
	var overview: String?
	var popularity: Double?
	var posterPath: String?
	var voteAverage: Double?
	var voteCount: Int?

	enum CodingKeys: String, CodingKey {
		case backdropPath = "backdrop_path"
		case firstAirDate = "first_air_date"
		case genreIds = "genre_ids"
		case id = "id"
		case name = "name"
		case originCountry = "origin_country"
		case originalLanguage = "original_language"
		case originalName = "original_name"
		case overview = "overview"
		case popularity = "popularity"
		case posterPath = "poster_path"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}
}
