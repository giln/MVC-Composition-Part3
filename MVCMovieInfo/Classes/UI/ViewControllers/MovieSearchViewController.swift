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

    private let movieSearchFetcherViewController = MovieSearchFetcherViewController()
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search Movie"
        view.backgroundColor = UIColor.white
        setupNavigationBar()

        add(asChildViewController: movieSearchFetcherViewController)
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

    // MARK: - UISearchResultsUpdating

    public func updateSearchResults(for _: UISearchController) {
        movieSearchFetcherViewController.searchMovie(query: searchController.searchBar.text)
    }
}
