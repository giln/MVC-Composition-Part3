//
//  ImageWithFourLabelView+Listable.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

public extension ImageWithFourLabelView {
    func configure(with element: Listable) {
        firstLabel.text = element.firstText
        secondLabel.text = element.secondText
        thirdLabel.text = element.thirdText
        fourthLabel.text = element.fourthText
        imageView.url = element.imageUrl
    }
}
