//
//  MovieSearchFetcherViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 05/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class MovieSearchFetcherViewController: UIViewController {
    var service: MovieService = MovieStore.shared

    // MARK: - Variables

    private let listStateViewController = ListStateViewController<ImageWithFourLabelsView>()
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        add(asChildViewController: listStateViewController)
        listStateViewController.state = .empty("Start searching your favorite movies")
    }

    // MARK: - Public

    open func searchMovie(query: String?) {
        guard let query = query, !query.isEmpty else {
            listStateViewController.state = .empty("Start searching your favorite movies")
            return
        }

        listStateViewController.state = .loading

        service.searchMovie(query: query, params: nil, successHandler: {
            [unowned self] response in

            self.listStateViewController.state = .list(response.results)

        }, errorHandler: {
            [unowned self] error in

            self.listStateViewController.state = .error(error.localizedDescription)
        })
    }
}
