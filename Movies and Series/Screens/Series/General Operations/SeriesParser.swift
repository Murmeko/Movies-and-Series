//
//  SeriesParser.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import Foundation

protocol SeriesParserProtocol {
  func createSeriesCellViewModel(from seriesResult: SeriesResult) -> BaseCollectionViewCellViewModelProtocol
}

class SeriesParser: SeriesParserProtocol {
  func createSeriesCellViewModel(from seriesResult: SeriesResult) -> BaseCollectionViewCellViewModelProtocol {
    return SeriesCollectionViewCellViewModel(seriesResult: seriesResult)
  }
}
