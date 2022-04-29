//
//  MoviesCollectionViewCell.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 29.04.2022.
//

import SnapKit
import Kingfisher

class MoviesCollectionViewCell: BaseCollectionViewCell {
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
		label.text = "The Lord of the Rings: The Two Towers"
		label.textColor = .white
		label.numberOfLines = 3
		return label
	}()

	lazy var genresLabel: UILabel = {
		let label = UILabel()
		label.text = "Adventure, Fantasy, Action"
		label.textColor = .white
		return label
	}()

	lazy var dateLabel: UILabel = {
		let label = UILabel()
		label.text = "10.12.2002"
		label.textColor = .white
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
		label.textColor = .white
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension MoviesCollectionViewCell {
	private func setupPosterImageView() {
		contentView.addSubview(posterImageView)
		posterImageView.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(10)
			make.left.equalToSuperview().offset(10)
			make.bottom.equalToSuperview().offset(-10)
			make.width.equalTo(contentView.frame.height / 16 * 9)
		}
	}

	private func setupTitleLabel() {
		contentView.addSubview(titleLabel)
		titleLabel.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(10)
			make.left.equalTo(posterImageView.snp.right).offset(10)
			make.right.equalToSuperview().offset(-10)
		}
	}

	private func setupGenresLabel() {
		contentView.addSubview(genresLabel)
		genresLabel.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(3)
			make.left.equalTo(posterImageView.snp.right).offset(10)
			make.right.equalToSuperview().offset(-10)
		}
	}

	private func setupDateLabel() {
		contentView.addSubview(dateLabel)
		dateLabel.snp.makeConstraints { make in
			make.top.greaterThanOrEqualTo(genresLabel.snp.bottom).offset(10)
			make.left.greaterThanOrEqualTo(posterImageView.snp.right).offset(10)
			make.bottom.equalToSuperview().offset(-15)
		}
	}

	private func setupRatingContainerView() {
		contentView.addSubview(ratingContainerView)
		ratingContainerView.snp.makeConstraints { make in
			make.top.greaterThanOrEqualTo(genresLabel.snp.bottom).offset(10)
			make.left.equalTo(dateLabel.snp.right).offset(10)
			make.right.equalToSuperview().offset(-10)
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
			make.right.equalToSuperview().offset(-7.5)
			make.bottom.equalToSuperview().offset(-5)
		}
	}
}

extension MoviesCollectionViewCell {
	func configureCell() {
		backgroundColor = UIColor(displayP3Red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
		layer.cornerRadius = 15
		layer.masksToBounds = true
		setupPosterImageView()
		setupTitleLabel()
		setupGenresLabel()
		setupDateLabel()
		setupRatingContainerView()
		posterImageView.kf.setImage(with: ImageResource(downloadURL: URL(string: "https://www.themoviedb.org/t/p/w1280/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg")!))
	}
}
