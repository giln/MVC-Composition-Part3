//
//  LoadingViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class LoadingViewController: UIViewController {
    // MARK: - Variables

    public let activityIndicator = UIActivityIndicatorView(style: .gray)

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        activityIndicator.hidesWhenStopped = true

        view.addSubview(activityIndicator)

        activityIndicator.center(in: view)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        activityIndicator.startAnimating()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        activityIndicator.stopAnimating()
    }
}
