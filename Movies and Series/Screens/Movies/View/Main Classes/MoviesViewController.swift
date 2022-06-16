//
//  MoviesViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 17.12.2021.
//

import SnapKit

class MoviesViewController: UIViewController {
	var moviesCollectionView: UICollectionView!

	var moviesManager = MoviesManager()

	let moviesThemeManager = ThemeManager()

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    if #available(iOS 13.0, *) {
      moviesThemeManager.traitCollectionDidChange()
    }
  }

	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
		setupThemeManager()
    bindViewModel()
    moviesManager.moviesPageProvider.requestPage(for: .first)
	}
}
