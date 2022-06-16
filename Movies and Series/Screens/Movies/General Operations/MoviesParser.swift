//
//  MoviesParser.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.05.2022.
//

import Foundation

protocol MoviesParserProtocol {
  func createMoviesCellViewModel(from moviesResult: MoviesResult) -> BaseCollectionViewCellViewModelProtocol
}

class MoviesParser: MoviesParserProtocol {
  func createMoviesCellViewModel(from moviesResult: MoviesResult) -> BaseCollectionViewCellViewModelProtocol {
    return MoviesCollectionViewCellViewModel(movieResult: moviesResult)
  }
}
