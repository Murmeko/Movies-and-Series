//
//  SeriesViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 5.12.2021.
//

import SnapKit

class SeriesViewController: UIViewController {
	var seriesCollectionView: UICollectionView!
	let seriesCollectionViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
	let seriesCollectionViewFlowLayout =  UICollectionViewFlowLayout()

	let themeManager = ThemeManager()

	override func viewDidLoad() {
		super.viewDidLoad()
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
		setupThemeManager()
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		if #available(iOS 13.0, *) {
			themeManager.traitCollectionDidChange()
		}
	}

	func setupThemeManager() {
		themeManager.updateTheme = { [weak self] in
			guard let self = self else { return }
			self.seriesCollectionView.backgroundColor = self.themeManager.backgroundColor
		}
		themeManager.setColors()
	}
}

extension SeriesViewController: UICollectionViewDelegate {
}

extension SeriesViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 30
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let collectionViewCell = seriesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellReuseIdentifiers.seriesCollectionViewCell, for: indexPath)
		return collectionViewCell
	}
}
