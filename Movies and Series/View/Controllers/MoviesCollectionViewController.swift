//
//  MoviesViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 5.12.2021.
//

import UIKit

class MoviesCollectionViewController: UICollectionViewController {
	@IBOutlet var moviesCollectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		moviesCollectionView.delegate = self
		moviesCollectionView.dataSource = self
		moviesCollectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReuseableMoviesCollectionViewCell")
	}

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "ReuseableMoviesCollectionViewCell", for: indexPath)
		return cell
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	 // Get the new view controller using segue.destination.
	 // Pass the selected object to the new view controller.
	 }
	 */

}
