//
//  Configurable.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 08/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

public protocol Configurable: UIView {
    associatedtype Element

    func configure(with: Element)
}
