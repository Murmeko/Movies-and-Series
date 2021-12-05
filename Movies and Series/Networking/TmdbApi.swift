//
//  TmdbApi.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 4.12.2021.
//

import Moya

enum ApiMethod {
    case popularMovies
    case upcomingMovies
    case topRatedMovies
    case movieDetails(movieId: Int)
    case movieGenres
}

struct TmdbApi {
    let apiMethod: ApiMethod
}

extension TmdbApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }

    var path: String {
        switch apiMethod {
        case .popularMovies:
            return "/movie/popular"
        case .upcomingMovies:
            return "/movie/upcoming"
        case .topRatedMovies:
            return "/movie/top_rated"
        case .movieDetails(movieId: let movieId):
            return "/3/movie/\(movieId)"
        case .movieGenres:
            return "/genre/movie/list"
        }
    }

    var method: Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        switch apiMethod {
        default:
            return ["" : ""]
        }
    }
}
