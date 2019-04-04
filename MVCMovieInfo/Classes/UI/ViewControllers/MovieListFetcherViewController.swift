//
//  MovieListFetcherViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class MovieListFetcherViewController: UIViewController {
    // MARK: - Variables

    public let listStateController = ListStateViewController()

    public let movieStore = MovieStore.shared

    public var endpoint: Endpoint = .nowPlaying {
        didSet {
            title = endpoint.description
        }
    }

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        title = endpoint.description
        add(asChildViewController: listStateController)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        listStateController.state = .loading

        movieStore.fetchMovies(from: endpoint, params: nil, successHandler: { moviesResponse in

            self.listStateController.state = .list(moviesResponse.results)
        }) { error in

            self.listStateController.state = .error(error.localizedDescription)
        }
    }
}
