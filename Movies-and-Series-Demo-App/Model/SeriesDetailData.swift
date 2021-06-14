//
//  SeriesDetailData.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import ObjectMapper

class SeriesDetailData: Mappable {

    var originalName: String?
    var originalLanguage: String?
    var episodeRunTime: [Int]?
    var spokenLanguages: [SeriesSpokenLanguages]?
    var networks: [Networks]?
    var productionCountries: [SeriesProductionCountries]?
    var voteCount: Int?
    var inProduction: Bool?
    var nextEpisodeToAir: NextEpisodeToAir?
    var numberOfEpisodes: Int?
    var popularity: Double?
    var seasons: [Seasons]?
    var name: String?
    var type: String?
    var createdBy: [CreatedBy]?
    var genres: [SeriesGenres]?
    var backdropPath: String?
    var voteAverage: Double?
    var productionCompanies: [SeriesProductionCompanies]?
    var posterPath: String?
    var status: String?
    var overview: String?
    var tagline: String?
    var firstAirDate: String?
    var languages: [String]?
    var originCountry: [String]?
    var homepage: String?
    var numberOfSeasons: Int?
    var lastAirDate: String?
    var lastEpisodeToAir: LastEpisodeToAir?
    var id: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        originalName <- map["original_name"]
        originalLanguage <- map["original_language"]
        episodeRunTime <- map["episode_run_time"]
        spokenLanguages <- map["spoken_languages"]
        networks <- map["networks"]
        productionCountries <- map["production_countries"]
        voteCount <- map["vote_count"]
        inProduction <- map["in_production"]
        nextEpisodeToAir <- map["next_episode_to_air"]
        numberOfEpisodes <- map["number_of_episodes"]
        popularity <- map["popularity"]
        seasons <- map["seasons"]
        name <- map["name"]
        type <- map["type"]
        createdBy <- map["created_by"]
        genres <- map["genres"]
        backdropPath <- map["backdrop_path"]
        voteAverage <- map["vote_average"]
        productionCompanies <- map["production_companies"]
        posterPath <- map["poster_path"]
        status <- map["status"]
        overview <- map["overview"]
        tagline <- map["tagline"]
        firstAirDate <- map["first_air_date"]
        languages <- map["languages"]
        originCountry <- map["origin_country"]
        homepage <- map["homepage"]
        numberOfSeasons <- map["number_of_seasons"]
        lastAirDate <- map["last_air_date"]
        lastEpisodeToAir <- map["last_episode_to_air"]
        id <- map["id"]
    }
}

class SeriesSpokenLanguages: Mappable {

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

class Networks: Mappable {

    var name: String?
    var logoPath: String?
    var id: Int?
    var originCountry: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        logoPath <- map["logo_path"]
        id <- map["id"]
        originCountry <- map["origin_country"]
    }
}

class SeriesProductionCountries: Mappable {

    var name: String?
    var iso31661: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        iso31661 <- map["iso_3166_1"]
    }
}

class NextEpisodeToAir: Mappable {

    var id: Int?
    var episodeNumber: Int?
    var voteAverage: Double?
    var productionCode: String?
    var airDate: String?
    var overview: String?
    var stillPath: Any?
    var seasonNumber: Int?
    var name: String?
    var voteCount: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        episodeNumber <- map["episode_number"]
        voteAverage <- map["vote_average"]
        productionCode <- map["production_code"]
        airDate <- map["air_date"]
        overview <- map["overview"]
        stillPath <- map["still_path"]
        seasonNumber <- map["season_number"]
        name <- map["name"]
        voteCount <- map["vote_count"]
    }
}

class Seasons: Mappable {

    var seasonNumber: Int?
    var id: Int?
    var episodeCount: Int?
    var posterPath: String?
    var name: String?
    var overview: String?
    var airDate: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        seasonNumber <- map["season_number"]
        id <- map["id"]
        episodeCount <- map["episode_count"]
        posterPath <- map["poster_path"]
        name <- map["name"]
        overview <- map["overview"]
        airDate <- map["air_date"]
    }
}

class CreatedBy: Mappable {

    var creditId: String?
    var gender: Int?
    var profilePath: String?
    var name: String?
    var id: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        creditId <- map["credit_id"]
        gender <- map["gender"]
        profilePath <- map["profile_path"]
        name <- map["name"]
        id <- map["id"]
    }
}

class SeriesGenres: Mappable {

    var name: String?
    var id: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
}

class SeriesProductionCompanies: Mappable {

    var name: String?
    var logoPath: Any?
    var id: Int?
    var originCountry: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        logoPath <- map["logo_path"]
        id <- map["id"]
        originCountry <- map["origin_country"]
    }
}

class LastEpisodeToAir: Mappable {

    var id: Int?
    var episodeNumber: Int?
    var voteAverage: Double?
    var productionCode: String?
    var airDate: String?
    var overview: String?
    var stillPath: String?
    var seasonNumber: Int?
    var name: String?
    var voteCount: Int?

    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        episodeNumber <- map["episode_number"]
        voteAverage <- map["vote_average"]
        productionCode <- map["production_code"]
        airDate <- map["air_date"]
        overview <- map["overview"]
        stillPath <- map["still_path"]
        seasonNumber <- map["season_number"]
        name <- map["name"]
        voteCount <- map["vote_count"]
    }
}
