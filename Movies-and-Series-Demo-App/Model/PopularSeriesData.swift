//
//  PopularSeriesData.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import ObjectMapper

class PopularSeriesData: Mappable {

    var totalPages: Int?
    var page: Int?
    var results: [SeriesResults]?
    var totalResults: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        totalPages <- map["total_pages"]
        page <- map["page"]
        results <- map["results"]
        totalResults <- map["total_results"]
    }
}

class SeriesResults: Mappable {

    var backdropPath: String?
    var originCountry: [String]?
    var posterPath: String?
    var originalName: String?
    var voteAverage: Double?
    var popularity: Double?
    var firstAirDate: String?
    var name: String?
    var genreIds: [Int]?
    var voteCount: Int?
    var id: Int?
    var originalLanguage: String?
    var overview: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        backdropPath <- map["backdrop_path"]
        originCountry <- map["origin_country"]
        posterPath <- map["poster_path"]
        originalName <- map["original_name"]
        voteAverage <- map["vote_average"]
        popularity <- map["popularity"]
        firstAirDate <- map["first_air_date"]
        name <- map["name"]
        genreIds <- map["genre_ids"]
        voteCount <- map["vote_count"]
        id <- map["id"]
        originalLanguage <- map["original_language"]
        overview <- map["overview"]
    }
}
