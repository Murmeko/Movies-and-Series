//
//  SeriesViewController+Setup.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import UIKit

extension SeriesViewController {
  func setupCollectionView() {
    let seriesCollectionViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    let seriesCollectionViewFlowLayout =  UICollectionViewFlowLayout()
    seriesCollectionViewFlowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 45) / 2, height: UIScreen.main.bounds.width - 30)
    seriesCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    seriesCollectionView = UICollectionView(frame: seriesCollectionViewFrame, collectionViewLayout: seriesCollectionViewFlowLayout)
    view.addSubview(seriesCollectionView)
    seriesCollectionView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.bottom.equalToSuperview()
    }
    seriesCollectionView.register(SeriesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CellReuseIdentifiers.seriesCollectionViewCell)
    seriesCollectionView.delegate = self
    seriesCollectionView.dataSource = self
  }

  func setupThemeManager() {
    seriesThemeManager.updateTheme = { [weak self] in
      guard let self = self else { return }
      self.seriesCollectionView.backgroundColor = self.seriesThemeManager.backgroundColor
    }
    seriesThemeManager.setColors()
  }

  func bindViewModel() {
    seriesManager.seriesViewModel.reloadData = { [weak self] in
      guard let self = self else { return }
      self.seriesCollectionView.reloadData()
    }
  }
}
