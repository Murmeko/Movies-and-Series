//
//  MoviesPageProvider.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.05.2022.
//

import Foundation

protocol MoviesPageProviderProtocol {
  func requestPage(for pageType: PageType)
}

class MoviesPageProvider: MoviesPageProviderProtocol {
  var moviesViewModel: MoviesViewModelProtocol
  var moviesNetworkManager: MoviesNetworkManager
  var moviesParser: MoviesParserProtocol

  var isFetchingData: Bool

  var currentPage: Int

  var totalPages: Int

  init(viewModel: MoviesViewModelProtocol, networkManager: MoviesNetworkManager, parser: MoviesParserProtocol) {
    moviesViewModel = viewModel
    moviesNetworkManager = networkManager
    moviesParser = parser
    isFetchingData = false
    currentPage = 0
    totalPages = 0
  }
}

extension MoviesPageProvider {
  func requestPage(for pageType: PageType) {
    switch pageType {
    case .first:
      if !isFetchingData {
        isFetchingData = true
        currentPage = 1
        moviesNetworkManager.requestPopularMovies(page: currentPage) { [weak self] moviesModel in
          guard let self = self else { return }
          self.isFetchingData = false
          guard let moviesModel = moviesModel else { return }
          var cellViewModelList: [BaseCollectionViewCellViewModelProtocol]  = []
          self.totalPages = moviesModel.totalPages ?? 1
          moviesModel.results?.forEach({ moviesResult in
            cellViewModelList.append(self.moviesParser.createMoviesCellViewModel(from: moviesResult))
          })
          self.moviesViewModel.cellViewModelList = cellViewModelList
          self.moviesViewModel.reloadData?()
        }
      } else {
        moviesViewModel.reloadData?()
      }
    case .next:
      if !isFetchingData && totalPages - currentPage >= 0 {
        isFetchingData = true
        currentPage += 1
        moviesNetworkManager.requestPopularMovies(page: currentPage) { [weak self] moviesModel in
          guard let self = self else { return }
          self.isFetchingData = false
          guard let moviesModel = moviesModel else { return }
          moviesModel.results?.forEach({ moviesResult in
            self.moviesViewModel.cellViewModelList.append(self.moviesParser.createMoviesCellViewModel(from: moviesResult))
          })
          self.moviesViewModel.reloadData?()
        }
      } else {
        moviesViewModel.reloadData?()
      }
    }
  }
}

enum PageType {
  case first, next
}
