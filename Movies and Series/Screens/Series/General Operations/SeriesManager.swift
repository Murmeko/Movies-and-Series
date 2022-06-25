//
//  SeriesManager.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import Foundation

struct SeriesManager {
  lazy var seriesViewModel: SeriesViewModelProtocol = {
    return SeriesViewModel()
  }()
  lazy var seriesNetworkManager: SeriesNetworkManager = {
    return SeriesNetworkManager()
  }()
  lazy var seriesParser: SeriesParserProtocol = {
    return SeriesParser()
  }()
  lazy var seriesPageProvider: MainBasePageProviderProtocol = {
    return SeriesPageProvider(viewModel: seriesViewModel, networkManager: seriesNetworkManager, parser: seriesParser)
  }()
}
