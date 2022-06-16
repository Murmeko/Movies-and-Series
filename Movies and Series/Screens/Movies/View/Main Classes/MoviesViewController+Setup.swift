//
//  MoviesViewController+Setup.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.05.2022.
//

import UIKit

extension MoviesViewController {
  func setupCollectionView() {
    let moviesCollectionViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    let moviesCollectionViewFlowLayout =  UICollectionViewFlowLayout()
    moviesCollectionViewFlowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: (UIScreen.main.bounds.width - 10) / 2.5)
    moviesCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    moviesCollectionView = UICollectionView(frame: moviesCollectionViewFrame, collectionViewLayout: moviesCollectionViewFlowLayout)
    view.addSubview(moviesCollectionView)
    moviesCollectionView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.bottom.equalToSuperview()
    }
    moviesCollectionView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CellReuseIdentifiers.moviesCollectionViewCell)
    moviesCollectionView.delegate = self
    moviesCollectionView.dataSource = self
  }

  func setupThemeManager() {
    moviesThemeManager.updateTheme = { [weak self] in
      guard let self = self else { return }
      self.moviesCollectionView.backgroundColor = self.moviesThemeManager.backgroundColor
    }
    moviesThemeManager.setColors()
  }

  func bindViewModel() {
    moviesManager.moviesViewModel.reloadData = { [weak self] in
      guard let self = self else { return }
      self.moviesCollectionView.reloadData()
    }
  }
}
