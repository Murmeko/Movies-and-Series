//
//  SeriesCollectionViewCell.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 30.04.2022.
//

import SnapKit
import Kingfisher

class SeriesCollectionViewCell: UICollectionViewCell {
	lazy var posterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 15
		return imageView
	}()

	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Rick and Morty"
		label.textAlignment = .natural
		label.font = .boldSystemFont(ofSize: 22)
		label.numberOfLines = 3
		return label
	}()

	lazy var ratingContainerView: UIView = {
		let view = UIView()
		view.backgroundColor = .systemBlue
		return view
	}()

	lazy var ratingImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "star.fill")
		imageView.tintColor = .white
		return imageView
	}()

	lazy var ratingLabel: UILabel = {
		let label = UILabel()
		label.text = "10.0"
		label.font = .boldSystemFont(ofSize: 17)
		label.textColor = .white
		return label
	}()

	let themeManager = ThemeManager()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension SeriesCollectionViewCell {
	private func setupPosterImageView() {
		contentView.addSubview(posterImageView)
		posterImageView.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(10)
			make.left.equalToSuperview().offset(10)
			make.right.equalToSuperview().offset(-10)
			make.height.equalTo(contentView.frame.width / 9 * 12)
		}
	}

	private func setupTitleLabel() {
		contentView.addSubview(titleLabel)
		titleLabel.snp.makeConstraints { make in
			make.top.equalTo(posterImageView.snp.bottom).offset(5)
			make.left.equalToSuperview().offset(10)
			make.right.equalToSuperview().offset(-10)
		}
	}

	private func setupRatingContainerView() {
		contentView.addSubview(ratingContainerView)
		ratingContainerView.snp.makeConstraints { make in
			make.top.greaterThanOrEqualTo(titleLabel.snp.bottom).offset(10)
			make.left.equalToSuperview().offset(10)
			make.bottom.equalToSuperview().offset(-10)
			make.height.equalTo(30.5)
		}
		ratingContainerView.layer.cornerRadius = 15.25
		setupRatingImageView()
		setupRatingLabel()
	}

	private func setupRatingImageView() {
		ratingContainerView.addSubview(ratingImageView)
		ratingImageView.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(5)
			make.left.equalToSuperview().offset(7.5)
			make.bottom.equalToSuperview().offset(-5)
		}
	}

	private func setupRatingLabel() {
		ratingContainerView.addSubview(ratingLabel)
		ratingLabel.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(5)
			make.left.equalTo(ratingImageView.snp.right).offset(5)
			make.right.equalToSuperview().offset(-10)
			make.bottom.equalToSuperview().offset(-5)
		}
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		if #available(iOS 13.0, *) {
			themeManager.traitCollectionDidChange()
		}
	}
}

extension SeriesCollectionViewCell {
	func configureCell() {
		setupThemeManager()
		layer.cornerRadius = 15
		layer.masksToBounds = true
		setupPosterImageView()
		setupTitleLabel()
		setupRatingContainerView()
		posterImageView.kf.setImage(with: ImageResource(downloadURL: URL(string: "https://www.themoviedb.org/t/p/w1280/sGVCWtLG37mLOhl11qQVrjKsDzx.jpg")!))
	}

	func setupThemeManager() {
		themeManager.updateTheme = { [weak self] in
			guard let self = self else { return }
			self.backgroundColor = self.themeManager.cellBackgroundColor
		}
		themeManager.setColors()
	}
}
