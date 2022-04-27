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

	override func viewDidLoad() {
		super.viewDidLoad()
		moviesCollectionViewFlowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: (UIScreen.main.bounds.width - 10) / 1.75)
		moviesCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
		moviesCollectionView = UICollectionView(frame: moviesCollectionViewFrame, collectionViewLayout: moviesCollectionViewFlowLayout)
		view.addSubview(moviesCollectionView)
		moviesCollectionView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalToSuperview()
		}
		moviesCollectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReuseableMoviesCollectionViewCell")
		moviesCollectionView.delegate = self
		moviesCollectionView.dataSource = self
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
		let collectionViewCell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "ReuseableMoviesCollectionViewCell", for: indexPath)
		return collectionViewCell
	}
}
