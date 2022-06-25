//
//  SeriesCollectionViewCellViewModel.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import Foundation

protocol SeriesCollectionViewCellViewModelProtocol: BaseCollectionViewCellViewModelProtocol {
  var seriesBackdropPath: String? { get set }
  var seriesFirstAirDate: String? { get set }
  var seriesGenreIds: [Int]? { get set }
  var seriesId: Int? { get set }
  var seriesName: String? { get set }
  var seriesOriginCountry: [String]? { get set }
  var seriesOriginalLanguage: String? { get set }
  var seriesOriginalName: String? { get set }
  var seriesOverview: String? { get set }
  var seriesPopularity: Double? { get set }
  var seriesPosterPath: String? { get set }
  var seriesVoteAverage: Double? { get set }
  var seriesVoteCount: Int? { get set }
}

class SeriesCollectionViewCellViewModel: BaseCollectionViewCellViewModel, SeriesCollectionViewCellViewModelProtocol {
  var seriesBackdropPath: String?
  var seriesFirstAirDate: String?
  var seriesGenreIds: [Int]?
  var seriesId: Int?
  var seriesName: String?
  var seriesOriginCountry: [String]?
  var seriesOriginalLanguage: String?
  var seriesOriginalName: String?
  var seriesOverview: String?
  var seriesPopularity: Double?
  var seriesPosterPath: String?
  var seriesVoteAverage: Double?
  var seriesVoteCount: Int?

  init(seriesResult: SeriesResult) {
    seriesBackdropPath = seriesResult.backdropPath
    seriesFirstAirDate = seriesResult.firstAirDate
    seriesGenreIds = seriesResult.genreIds
    seriesId = seriesResult.id
    seriesName = seriesResult.name
    seriesOriginCountry = seriesResult.originCountry
    seriesOriginalLanguage = seriesResult.originalLanguage
    seriesOriginalName = seriesResult.originalName
    seriesOverview = seriesResult.overview
    seriesPopularity = seriesResult.popularity
    seriesPosterPath = seriesResult.posterPath
    seriesVoteAverage = seriesResult.voteAverage
    seriesVoteCount = seriesResult.voteCount
    super.init()
  }
}
