//
//  SeriesViewModel.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import Foundation

protocol SeriesViewModelProtocol {
  var cellViewModelList: [BaseCollectionViewCellViewModelProtocol] { get set }
  var reloadData: (() -> Void)? { get set }
}

class SeriesViewModel: SeriesViewModelProtocol {
  var cellViewModelList: [BaseCollectionViewCellViewModelProtocol] = []
  var reloadData: (() -> Void)?
}
