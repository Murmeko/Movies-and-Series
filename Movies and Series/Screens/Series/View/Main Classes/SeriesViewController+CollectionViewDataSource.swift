//
//  SeriesViewController+CollectionViewDataSource.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import UIKit

extension SeriesViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return seriesManager.seriesViewModel.cellViewModelList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collectionViewCell = seriesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellReuseIdentifiers.seriesCollectionViewCell, for: indexPath)
    guard let collectionViewCell = collectionViewCell as? BaseCollectionViewCell else {
      fatalError("Could not cast CollectionViewCell as BaseCollectionViewCell")
    }
    collectionViewCell.configureCell(with: indexPath, seriesManager.seriesViewModel.cellViewModelList[indexPath.row])
    return collectionViewCell
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
      seriesManager.seriesPageProvider.requestPage(for: .next)
    }
  }
}
