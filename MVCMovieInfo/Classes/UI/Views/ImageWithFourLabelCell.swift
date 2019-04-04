//
//  ImageWithFourLabelCell.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 29/03/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class ImageWithFourLabelCell: UITableViewCell {

    public let layout = ImageWithFourLabelView()

    // MARK: - Lifecycle

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        commonInit()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    private func commonInit() {
        contentView.addSubview(layout)
        layout.anchor(in: contentView)
    }
}
