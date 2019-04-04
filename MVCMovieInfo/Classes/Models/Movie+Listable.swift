//
//  Movie+Listable.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import Foundation

extension Movie: Listable {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    public var firstText: String {
        return title
    }

    public var secondText: String {
        return overview
    }

    public var thirdText: String {
        return Movie.dateFormatter.string(from: releaseDate)
    }

    public var fourthText: String {
        let rating = Int(voteAverage)
        let ratingText = (0 ..< rating).reduce("") { (acc, _) -> String in
            return acc + "⭐️"
        }
        return ratingText
    }

    public var imageUrl: URL {
        return posterURL
    }
}
