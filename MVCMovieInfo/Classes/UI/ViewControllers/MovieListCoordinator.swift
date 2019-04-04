//
//  MovieListCoordinator.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class MovieListCoordinator: UIViewController {
    // MARK: - Variables

    let segmentedController = SegmentedViewController()
    let topMovieFetcherViewController = MovieListFetcherViewController()
    let nowPlayingMovieFetcherViewController = MovieListFetcherViewController()
    let popularMovieFetcherViewController = MovieListFetcherViewController()
    let upcomingMovieFetcherViewController = MovieListFetcherViewController()

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        add(asChildViewController: segmentedController)

        topMovieFetcherViewController.endpoint = .topRated
        nowPlayingMovieFetcherViewController.endpoint = .nowPlaying
        popularMovieFetcherViewController.endpoint = .popular
        upcomingMovieFetcherViewController.endpoint = .upcoming

        segmentedController.items = [nowPlayingMovieFetcherViewController, upcomingMovieFetcherViewController, popularMovieFetcherViewController, topMovieFetcherViewController]
    }
}
