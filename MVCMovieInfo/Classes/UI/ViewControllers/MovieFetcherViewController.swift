//
//  MovieFetcherViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class MovieFetcherViewController: UIViewController {
    // MARK: - Variables

    public var movieStore = MovieStore.shared
    private let listController = ListViewController()

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        add(asChildViewController: listController)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        movieStore.fetchMovies(from: .topRated, params: nil, successHandler: { [weak self] moviesResponse in

            self?.listController.list = moviesResponse.results
        }) { error in
            print(error)
        }
    }
}
