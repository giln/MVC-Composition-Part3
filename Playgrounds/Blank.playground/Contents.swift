import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}


open class MovieListFetcherViewController1: UIViewController {
    // MARK: - Variables

    public let listController = ListViewController()
    private let loadingViewController = LoadingViewController()

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
        add(asChildViewController: listController)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        remove(viewControllerToRemove: listController)
        add(asChildViewController: loadingViewController)

        movieStore.fetchMovies(from: endpoint, params: nil, successHandler: { moviesResponse in

            self.remove(viewControllerToRemove: self.loadingViewController)
            self.add(asChildViewController: self.listController)
            self.listController.list = moviesResponse.results
        }) { error in
            self.remove(viewControllerToRemove: self.loadingViewController)
        }
    }
}

let fetcher = MovieListFetcherViewController1()

PlaygroundPage.current.liveView = fetcher
