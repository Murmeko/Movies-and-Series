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

	override func viewDidLoad() {
		super.viewDidLoad()
		seriesCollectionViewFlowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 45) / 2, height: UIScreen.main.bounds.width)
		seriesCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
		seriesCollectionView = UICollectionView(frame: seriesCollectionViewFrame, collectionViewLayout: seriesCollectionViewFlowLayout)
		view.addSubview(seriesCollectionView)
		seriesCollectionView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalToSuperview()
		}
		seriesCollectionView.register(UINib(nibName: "SeriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReuseableSeriesCell")
		seriesCollectionView.delegate = self
		seriesCollectionView.dataSource = self
	}
}

extension SeriesViewController: UICollectionViewDelegate {
}

extension SeriesViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let collectionViewCell = seriesCollectionView.dequeueReusableCell(withReuseIdentifier: "ReuseableSeriesCell", for: indexPath)
		return collectionViewCell
	}
}
