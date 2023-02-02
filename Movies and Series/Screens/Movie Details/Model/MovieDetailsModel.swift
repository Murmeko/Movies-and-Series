//
//  MovieDetailsModel.swift
//  Movies and Series
//
//  Created by Murmeko on 31.10.2022.
//

import Foundation

// MARK: - MovieDetailsModel
struct MovieDetailsModel: Codable {
  var adult: Bool?
  var backdropPath: String?
  var belongsToCollection: BelongsToCollectionModel?
  var budget: Int?
  var genres: [GenreModel]?
  var homepage: String?
  var id: Int?
  var imdbId: String?
  var originalLanguage: String?
  var originalTitle: String?
  var overview: String?
  var popularity: Double?
  var posterPath: String?
  var productionCompanies: [ProductionCompanyModel]?
  var productionCountries: [ProductionCountryModel]?
  var releaseDate: String?
  var revenue: Int?
  var runtime: Int?
  var spokenLanguages: [SpokenLanguageModel]?
  var status: String?
  var tagline: String?
  var title: String?
  var video: Bool?
  var voteAverage: Double?
  var voteCount: Int?

  enum CodingKeys: String, CodingKey {
    case adult = "adult"
    case backdropPath = "backdrop_path"
    case belongsToCollection = "belongs_to_collection"
    case budget = "budget"
    case genres = "genres"
    case homepage = "homepage"
    case id = "id"
    case imdbId = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview = "overview"
    case popularity = "popularity"
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountries = "production_countries"
    case releaseDate = "release_date"
    case revenue = "revenue"
    case runtime = "runtime"
    case spokenLanguages = "spoken_languages"
    case status = "status"
    case tagline = "tagline"
    case title = "title"
    case video = "video"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}

// MARK: - BelongsToCollectionModel
struct BelongsToCollectionModel: Codable {
  var id: Int?
  var name: String?
  var posterPath: String?
  var backdropPath: String?

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case posterPath = "poster_path"
    case backdropPath = "backdrop_path"
  }
}

// MARK: - GenreModel
struct GenreModel: Codable {
  var id: Int?
  var name: String?

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
  }
}

// MARK: - ProductionCompanyModel
struct ProductionCompanyModel: Codable {
  var id: Int?
  var logoPath: String?
  var name: String?
  var originCountry: String?

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case logoPath = "logo_path"
    case name = "name"
    case originCountry = "origin_country"
  }
}

// MARK: - ProductionCountryModel
struct ProductionCountryModel: Codable {
  var isoCode: String?
  var name: String?

  enum CodingKeys: String, CodingKey {
    case isoCode = "iso_3166_1"
    case name = "name"
  }
}

// MARK: - SpokenLanguageModel
struct SpokenLanguageModel: Codable {
  var englishName: String?
  var isoCode: String?
  var name: String?

  enum CodingKeys: String, CodingKey {
    case englishName = "english_name"
    case isoCode = "iso_639_1"
    case name = "name"
  }
}
