//
//  ThemeManager.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import Foundation
import UIKit

class ThemeManager {
	var backgroundColor: UIColor!
	var cellBackgroundColor: UIColor!
	var updateTheme: (() -> Void)?

  func setColors() {
		if #available(iOS 13.0, *) {
			traitCollectionDidChange()
		} else {
      backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.95)
			cellBackgroundColor = .white
			updateTheme?()
		}
	}

	@available (iOS 13.0, *)
	func traitCollectionDidChange() {
		if UITraitCollection.current.userInterfaceStyle == .light {
			backgroundColor = .secondarySystemBackground
			cellBackgroundColor = .systemBackground
			updateTheme?()
		} else {
			backgroundColor = .systemBackground
			cellBackgroundColor = .secondarySystemBackground
			updateTheme?()
		}
	}
}
