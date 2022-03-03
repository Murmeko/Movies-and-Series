//
//  MoviesListView.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 16.12.2021.
//

import SwiftUI

struct Movie: Identifiable {
	let id = UUID()
}

struct MoviesView: View {

	var columns: [GridItem] = [
		GridItem(.flexible())
	]

	let movies: [Movie] = [
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie(),
		Movie()
	]

	var body: some View {
		GeometryReader { geometry in
			ScrollView {
				LazyVGrid(columns: columns, spacing: 0) {
					ForEach(movies) { _ in
						MoviesListView(image: Image("moviePlaceholder"), title: "LOTR", genres: "Nil", rating: "10.0", height: geometry.size.width / 2.5)
							.padding(.horizontal, geometry.size.width / 37.5)
							.padding(.vertical, geometry.size.width / 75)
					}
				}
			}
		}
	}
}

struct MoviesListView: View {
	let image: Image
	let title: String
	let genres: String
	let rating: String
	let height: CGFloat
	var body: some View {
		HStack(alignment: .center, spacing: height / 15) {
			MoviePosterView(image: Image("moviePlaceholder"), height: height)

			VStack(alignment: .leading, spacing: height / 7.5) {
				MovieTitleView(title: title, genres: genres, height: height)
			}
		}.onTapGesture {
			print("Lolo")
		}
	}
}

struct MoviePosterView: View {
	let image: Image
	let height: CGFloat

	var body: some View {
		image
			.resizable()
			.aspectRatio(contentMode: .fill)
			.clipped()
			.frame(width: height / 1.5, height: height, alignment: .center)
			.cornerRadius(height / 7.5)
	}
}

struct MovieTitleView: View {
	let title: String
	let genres: String
	let height: CGFloat

	var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.font(.system(size: height / 7.5))
				.fontWeight(.heavy)
				.multilineTextAlignment(.leading)
				.lineLimit(3)

			Text(genres)
				.font(.system(size: height / 10))
				.fontWeight(.regular)
				.lineLimit(1)

			Spacer()

			HStack(alignment: .center) {
				Spacer()

				RatingView(rating: "10.0", height: height)
			}
		}
	}
}

struct RatingView: View {
	let rating: String
	let height: CGFloat
	var body: some View {
		ZStack(alignment: .center) {
			Color(UIColor.systemBlue)
			HStack(alignment: .center, spacing: height / 60) {
				Image("star")
					.foregroundColor(.white)
					.frame(width: height / 7.5, height: height / 7.5, alignment: .center)
					.font(.system(size: height / 10))
				Text(rating)
					.font(.system(size: height / 9.375))
					.fontWeight(.bold)
					.foregroundColor(Color.white)
			}
		}.frame(maxWidth: height / 1.875, maxHeight: height / 3.75, alignment: .center)
			.cornerRadius(height / 3)
	}
}

struct MoviesListView_Previews: PreviewProvider {
	static var previews: some View {
		MoviesView()
			.previewDevice("iPhone X")
	}
}
