//
//  ImageWithFourLabelView.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 29/03/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class ImageWithFourLabelView: UIView {
    // MARK: - Variables

    private let horizontalStackView = UIStackView()
    private let verticalStackView = UIStackView()

    public let imageView = DownloadImageView()
    public let firstLabel = UILabel()
    public let secondLabel = UILabel()
    public let thirdLabel = UILabel()
    public let fourthLabel = UILabel()

    // MARK: - Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    // MARK: - Private

    private func commonInit() {
        backgroundColor = UIColor.white

        firstLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        firstLabel.adjustsFontForContentSizeCategory = true
        secondLabel.numberOfLines = 3
        thirdLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        thirdLabel.adjustsFontForContentSizeCategory = true

        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.alignment = .leading
        verticalStackView.spacing = 10

        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 20
        horizontalStackView.preservesSuperviewLayoutMargins = true
        horizontalStackView.isLayoutMarginsRelativeArrangement = true

        addSubview(horizontalStackView)

        horizontalStackView.anchor(in: self)

        horizontalStackView.addArrangedSubview(imageView)
        horizontalStackView.addArrangedSubview(verticalStackView)

        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        imageView.backgroundColor = UIColor.black
        verticalStackView.addArrangedSubview(firstLabel)
        verticalStackView.addArrangedSubview(secondLabel)
        verticalStackView.addArrangedSubview(thirdLabel)
        verticalStackView.addArrangedSubview(fourthLabel)
    }
}
