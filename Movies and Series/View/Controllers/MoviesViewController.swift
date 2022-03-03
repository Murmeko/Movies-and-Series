//
//  MoviesViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 17.12.2021.
//

import UIKit
import SwiftUI

class MoviesViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		setupMoviesView()
	}

	private func setupMoviesView() {
		let moviesView = UIHostingController(rootView: MoviesView())
		moviesView.view.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(moviesView.view)
		NSLayoutConstraint.activate([
			moviesView.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			moviesView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			moviesView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			moviesView.view.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
		])
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
