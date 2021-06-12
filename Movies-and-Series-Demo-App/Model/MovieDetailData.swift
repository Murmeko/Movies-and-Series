//
//  MovieDetailData.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import ObjectMapper

class MovieDetailData: Mappable {

    var status: String?
    var homepage: String?
    var releaseDate: String?
    var voteAverage: Double?
    var imdbId: String?
    var tagline: String?
    var spokenLanguages: [MovieSpokenLanguages]?
    var originalLanguage: String?
    var productionCompanies: [MovieProductionCompanies]?
    var runtime: Int?
    var productionCountries: [MovieProductionCountries]?
    var belongsToCollection: BelongsToCollection?
    var id: Int?
    var video: Bool?
    var budget: Int?
    var adult: Bool?
    var revenue: Int?
    var popularity: Double?
    var backdropPath: String?
    var genres: [MovieGenres]?
    var overview: String?
    var title: String?
    var voteCount: Int?
    var posterPath: String?
    var originalTitle: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        status <- map["status"]
        homepage <- map["homepage"]
        releaseDate <- map["release_date"]
        voteAverage <- map["vote_average"]
        imdbId <- map["imdb_id"]
        tagline <- map["tagline"]
        spokenLanguages <- map["spoken_languages"]
        originalLanguage <- map["original_language"]
        productionCompanies <- map["production_companies"]
        runtime <- map["runtime"]
        productionCountries <- map["production_countries"]
        belongsToCollection <- map["belongs_to_collection"]
        id <- map["id"]
        video <- map["video"]
        budget <- map["budget"]
        adult <- map["adult"]
        revenue <- map["revenue"]
        popularity <- map["popularity"]
        backdropPath <- map["backdrop_path"]
        genres <- map["genres"]
        overview <- map["overview"]
        title <- map["title"]
        voteCount <- map["vote_count"]
        posterPath <- map["poster_path"]
        originalTitle <- map["original_title"]
    }
}

class MovieSpokenLanguages: Mappable {

    var iso6391: String?
    var name: String?
    var englishName: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        iso6391 <- map["iso_639_1"]
        name <- map["name"]
        englishName <- map["english_name"]
    }
}

class MovieProductionCompanies: Mappable {

    var logoPath: Any?
    var name: String?
    var originCountry: String?
    var id: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        logoPath <- map["logo_path"]
        name <- map["name"]
        originCountry <- map["origin_country"]
        id <- map["id"]
    }
}

class MovieProductionCountries: Mappable {

    var iso31661: String?
    var name: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        iso31661 <- map["iso_3166_1"]
        name <- map["name"]
    }
}

class BelongsToCollection: Mappable {

    var id: Int?
    var backdropPath: Any?
    var name: String?
    var posterPath: Any?

    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        backdropPath <- map["backdrop_path"]
        name <- map["name"]
        posterPath <- map["poster_path"]
    }
}

class MovieGenres: Mappable {

    var name: String?
    var id: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
}
