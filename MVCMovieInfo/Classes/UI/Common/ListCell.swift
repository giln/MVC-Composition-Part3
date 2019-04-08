//
//  ListCell.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 08/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class ListCell<ContentView: Configurable>: UITableViewCell {

    static var defaultReuseIdentifier: String {
        return NSStringFromClass(ContentView.self)
    }
    public let content = ContentView()

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
        contentView.addSubview(content)
        content.anchor(in: contentView)
    }

}
