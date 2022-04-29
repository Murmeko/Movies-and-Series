//
//  BaseCollectionViewCell.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 29.04.2022.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
	var indexPath: IndexPath!
	var viewModel: BaseCollectionViewCellViewModel!

	func configureCell(with indexPath: IndexPath, _ viewModel: BaseCollectionViewCellViewModel) {
		self.indexPath = indexPath
		self.viewModel = viewModel
	}
}
