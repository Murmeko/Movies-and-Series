//
//  SeriesDetailsData.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import ObjectMapper

class SeriesDetailsData: Mappable {

    var genres: [SeriesGenres]?
    var firstAirDate: String?
    var overview: String?
    var episodeRunTime: [Int]?
    var posterPath: String?
    var name: String?
    var id: Int?
    var voteAverage: Double?

    required init?(map: Map) {}

    func mapping(map: Map) {
        genres <- map["genres"]
        firstAirDate <- map["first_air_date"]
        overview <- map["overview"]
        episodeRunTime <- map["episode_run_time"]
        posterPath <- map["poster_path"]
        name <- map["name"]
        id <- map["id"]
        voteAverage <- map["vote_average"]
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
