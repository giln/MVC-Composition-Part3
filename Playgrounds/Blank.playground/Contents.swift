import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

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

let movieListCoordinator = MovieListCoordinator()
PlaygroundPage.current.liveView = movieListCoordinator
