//
//  MoviesViewController+CollectionViewDataSource.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.05.2022.
//

import UIKit

extension MoviesViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return moviesManager.moviesViewModel.cellViewModelList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collectionViewCell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellReuseIdentifiers.moviesCollectionViewCell, for: indexPath)
    guard let collectionViewCell = collectionViewCell as? BaseCollectionViewCell else {
      fatalError("Could not cast CollectionViewCell as BaseCollectionViewCell")
    }
    collectionViewCell.configureCell(with: indexPath, moviesManager.moviesViewModel.cellViewModelList[indexPath.row])
    return collectionViewCell
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
      moviesManager.moviesPageProvider.requestPage(for: .next)
    }
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cellViewModel = moviesManager.moviesViewModel.cellViewModelList[indexPath.row] as? MoviesCollectionViewCellViewModelProtocol else { return }
    navigationController?.pushViewController(MovieDetailsViewController(), animated: true)
  }
}
