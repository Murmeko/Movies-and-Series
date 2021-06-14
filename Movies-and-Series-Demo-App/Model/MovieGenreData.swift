//
//  GenreData.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 13.06.2021.
//

import ObjectMapper

class MovieGenreData: Mappable {

    var genres: [Genres]?

    required init?(map: Map) {}

    func mapping(map: Map) {
        genres <- map["genres"]
    }
}

class Genres: Mappable {

    var id: Int?
    var name: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
