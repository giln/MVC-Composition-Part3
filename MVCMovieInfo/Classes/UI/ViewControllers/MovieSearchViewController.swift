//
//  MovieSearchViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class MovieSearchViewController: UIViewController, UISearchResultsUpdating {
    var service: MovieService = MovieStore.shared

    // MARK: - Variables

    private let listStateViewController = ListStateViewController()
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search Movie"
        view.backgroundColor = UIColor.white
        add(asChildViewController: listStateViewController)
        listStateViewController.state = .empty("Start searching your favorite movies")

        setupNavigationBar()
    }

    // MARK: - Private

    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        definesPresentationContext = true

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false

        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }

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

    // MARK: - UISearchResultsUpdating

    public func updateSearchResults(for _: UISearchController) {
        searchMovie(query: searchController.searchBar.text)
    }
}
