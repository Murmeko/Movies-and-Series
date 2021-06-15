//
//  PopularMoviesData.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import ObjectMapper

class PopularMoviesData: Mappable {

    var results: [MovieResults]?
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        results <- map["results"]
        page <- map["page"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
    }
}

class MovieResults: Mappable {

    var backdropPath: String?
    var overview: String?
    var video: Bool?
    var id: Int?
    var popularity: Double?
    var releaseDate: String?
    var posterPath: String?
    var voteAverage: Double?
    var genreIds: [Int]?
    var voteCount: Int?
    var originalTitle: String?
    var title: String?
    var originalLanguage: String?
    var adult: Bool?

    required init?(map: Map) {}

    func mapping(map: Map) {
        backdropPath <- map["backdrop_path"]
        overview <- map["overview"]
        video <- map["video"]
        id <- map["id"]
        popularity <- map["popularity"]
        releaseDate <- map["release_date"]
        posterPath <- map["poster_path"]
        voteAverage <- map["vote_average"]
        genreIds <- map["genre_ids"]
        voteCount <- map["vote_count"]
        originalTitle <- map["original_title"]
        title <- map["title"]
        originalLanguage <- map["original_language"]
        adult <- map["adult"]
    }
}
