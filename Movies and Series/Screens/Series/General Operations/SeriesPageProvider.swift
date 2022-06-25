//
//  SeriesPageProvider.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import Foundation

class SeriesPageProvider: MainBasePageProviderProtocol {
  var seriesViewModel: SeriesViewModelProtocol
  var seriesNetworkManager: SeriesNetworkManager
  var seriesParser: SeriesParserProtocol

  var isFetchingData: Bool

  var currentPage: Int
  var totalPages: Int

  init(viewModel: SeriesViewModelProtocol, networkManager: SeriesNetworkManager, parser: SeriesParserProtocol) {
    seriesViewModel = viewModel
    seriesNetworkManager = networkManager
    seriesParser = parser
    isFetchingData = false
    currentPage = 0
    totalPages = 0
  }
}

extension SeriesPageProvider {
  func requestPage(for pageType: PageType) {
    switch pageType {
    case .first:
      if !isFetchingData {
        isFetchingData = true
        currentPage = 1
        seriesNetworkManager.requestPopularSeries(page: currentPage) { [weak self] seriesModel in
          guard let self = self else { return }
          self.isFetchingData = false
          guard let seriesModel = seriesModel else { return }
          var cellViewModelList: [BaseCollectionViewCellViewModelProtocol]  = []
          self.totalPages = seriesModel.totalPages ?? 1
          seriesModel.results?.forEach({ seriesResult in
            cellViewModelList.append(self.seriesParser.createSeriesCellViewModel(from: seriesResult))
          })
          self.seriesViewModel.cellViewModelList = cellViewModelList
          self.seriesViewModel.reloadData?()
        }
      } else {
        seriesViewModel.reloadData?()
      }
    case .next:
      if !isFetchingData && totalPages - currentPage >= 0 {
        isFetchingData = true
        currentPage += 1
        seriesNetworkManager.requestPopularSeries(page: currentPage) { [weak self] seriesModel in
          guard let self = self else { return }
          self.isFetchingData = false
          guard let seriesModel = seriesModel else { return }
          seriesModel.results?.forEach({ seriesResult in
            self.seriesViewModel.cellViewModelList.append(self.seriesParser.createSeriesCellViewModel(from: seriesResult))
          })
          self.seriesViewModel.reloadData?()
        }
      } else {
        seriesViewModel.reloadData?()
      }
    }
  }
}
