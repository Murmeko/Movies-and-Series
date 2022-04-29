//
//  MainViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 5.12.2021.
//

import UIKit

class MainViewController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		var viewControllers: [UIViewController] = []
		let moviesViewController = MoviesViewController()
		moviesViewController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named: "film"), selectedImage: UIImage(named: "film.fill"))
		viewControllers.append(moviesViewController)
		self.viewControllers?.append(moviesViewController)
		let seriesViewController = SeriesViewController()
		seriesViewController.tabBarItem = UITabBarItem(title: "Series", image: UIImage(named: "tv"), selectedImage: UIImage(named: "tv.fill"))
		viewControllers.append(seriesViewController)
		self.viewControllers = viewControllers
	}
}
