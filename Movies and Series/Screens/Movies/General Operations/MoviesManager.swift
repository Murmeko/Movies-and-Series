//
//  MoviesManager.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 31.05.2022.
//

import Foundation

struct MoviesManager {
  lazy var moviesViewModel: MoviesViewModelProtocol = {
    return MoviesViewModel()
  }()
  lazy var moviesNetworkManager: MoviesNetworkManager = {
    return MoviesNetworkManager()
  }()
  lazy var moviesParser: MoviesParserProtocol = {
    return MoviesParser()
  }()
  lazy var moviesPageProvider: MoviesPageProviderProtocol = {
    return MoviesPageProvider(viewModel: moviesViewModel, networkManager: moviesNetworkManager, parser: moviesParser)
  }()
}
