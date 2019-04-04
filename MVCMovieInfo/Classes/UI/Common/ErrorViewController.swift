//
//  ErrorViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class ErrorViewController: UIViewController {

    // MARK: - Variables

    public let errorLabel = UILabel()

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center

        view.addSubview(errorLabel)

        errorLabel.anchor(in: view)
    }
}
