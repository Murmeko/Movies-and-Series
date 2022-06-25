//
//  SeriesViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 5.12.2021.
//

import SnapKit

class SeriesViewController: UIViewController {
	var seriesCollectionView: UICollectionView!

  var seriesManager = SeriesManager()

  let seriesThemeManager = ThemeManager()

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    if #available(iOS 13.0, *) {
      seriesThemeManager.traitCollectionDidChange()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupThemeManager()
    bindViewModel()
    seriesManager.seriesPageProvider.requestPage(for: .first)
  }
}
