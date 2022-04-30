//
//  MoviesViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 17.12.2021.
//

import SnapKit

class MoviesViewController: UIViewController {
	var moviesCollectionView: UICollectionView!
	let moviesCollectionViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
	let moviesCollectionViewFlowLayout =  UICollectionViewFlowLayout()

	let themeManager = ThemeManager()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
		setupThemeManager()
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		if #available(iOS 13.0, *) {
			themeManager.traitCollectionDidChange()
		}
	}

	func setupCollectionView() {
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
		themeManager.updateTheme = { [weak self] in
			guard let self = self else { return }
			self.moviesCollectionView.backgroundColor = self.themeManager.backgroundColor
		}
		themeManager.setColors()
	}
}

extension MoviesViewController: UICollectionViewDelegate {
}

extension MoviesViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let collectionViewCell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellReuseIdentifiers.moviesCollectionViewCell, for: indexPath)
		guard let collectionViewCell = collectionViewCell as? BaseCollectionViewCell else {
			fatalError("Could not cast CollectionViewCell as BaseCollectionViewCell")
		}
		collectionViewCell.configureCell(with: indexPath, BaseCollectionViewCellViewModel())
		return collectionViewCell
	}
}
