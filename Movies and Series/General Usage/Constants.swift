//
//  Constants.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 4.12.2021.
//

import Foundation

struct Constants {
  static let baseUrlString = "https://api.themoviedb.org/3"
	static let generalAPIKey = "b6650ec7332a29feb575cdf90c6985fd"
}

extension Constants {
	struct CellReuseIdentifiers {
		static let moviesCollectionViewCell = "ReuseableMoviesCollectionViewCell"
		static let seriesCollectionViewCell = "ReuseableSeriesCollectionViewCell"
	}
}
