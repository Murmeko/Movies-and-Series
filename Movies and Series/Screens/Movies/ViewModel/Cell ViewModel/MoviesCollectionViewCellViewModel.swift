//
//  MoviesCollectionViewCellViewModel.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.05.2022.
//

import Foundation

protocol MoviesCollectionViewCellViewModelProtocol: BaseCollectionViewCellViewModelProtocol {
  var movieAdult: Bool? { get set }
  var movieBackdropPath: String? { get set }
  var movieGenreIds: [Int]? { get set }
  var movieId: Int? { get set }
  var movieOriginalLanguage: String? { get set }
  var movieOriginalTitle: String? { get set }
  var movieOverview: String? { get set }
  var moviePopularity: Double? { get set }
  var moviePosterPath: String? { get set }
  var movieReleaseDate: String? { get set }
  var movieTitle: String? { get set }
  var movieVideo: Bool? { get set }
  var movieVoteAverage: Double? { get set }
  var movieVoteCount: Int? { get set }
}

class MoviesCollectionViewCellViewModel: BaseCollectionViewCellViewModel, MoviesCollectionViewCellViewModelProtocol {
  var movieAdult: Bool?
  var movieBackdropPath: String?
  var movieGenreIds: [Int]?
  var movieId: Int?
  var movieOriginalLanguage: String?
  var movieOriginalTitle: String?
  var movieOverview: String?
  var moviePopularity: Double?
  var moviePosterPath: String?
  var movieReleaseDate: String?
  var movieTitle: String?
  var movieVideo: Bool?
  var movieVoteAverage: Double?
  var movieVoteCount: Int?

  init(movieResult: MoviesResult) {
    movieAdult = movieResult.adult
    movieBackdropPath = movieResult.backdropPath
    movieGenreIds = movieResult.genreIds
    movieId = movieResult.id
    movieOriginalLanguage = movieResult.originalLanguage
    movieOriginalTitle = movieResult.originalTitle
    movieOverview = movieResult.overview
    moviePopularity = movieResult.popularity
    moviePosterPath = movieResult.posterPath
    movieReleaseDate = movieResult.releaseDate
    movieTitle = movieResult.title
    movieVideo = movieResult.video
    movieVoteAverage = movieResult.voteAverage
    movieVoteCount = movieResult.voteCount
    super.init()
  }
}
