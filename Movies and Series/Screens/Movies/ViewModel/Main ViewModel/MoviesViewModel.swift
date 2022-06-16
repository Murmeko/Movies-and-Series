//
//  MoviesViewModel.swift
//  Movies and Series
//
// Created by Yiğit Erdinç on 30.05.2022.
//

import Foundation

protocol MoviesViewModelProtocol {
  var cellViewModelList: [BaseCollectionViewCellViewModelProtocol] { get set }
  var reloadData: (() -> Void)? { get set }
}

class MoviesViewModel: MoviesViewModelProtocol {
  var cellViewModelList: [BaseCollectionViewCellViewModelProtocol] = []
  var reloadData: (() -> Void)?
}
