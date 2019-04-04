//
//  Listable.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import Foundation

public protocol Listable {
    var firstText: String { get }
    var secondText: String { get }
    var thirdText: String { get }
    var fourthText: String { get }
    var imageUrl: URL { get }
}
