import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

open class ListStateViewController: UIViewController {
    public enum State {
        case loading
        case list([Listable])
        case empty(String)
        case error(String)
    }

    // MARK: - Variables

    public var state = State.empty("") {
        didSet {
            switch state {
            case .loading:
                remove(viewControllerToRemove: emptyViewController)
                remove(viewControllerToRemove: errorViewController)
                remove(viewControllerToRemove: listViewController)
                add(asChildViewController: loadingViewController)
            case let .list(list):
                listViewController.list = list
                remove(viewControllerToRemove: emptyViewController)
                remove(viewControllerToRemove: errorViewController)
                remove(viewControllerToRemove: loadingViewController)
                add(asChildViewController: listViewController)
            case let .empty(emptyString):
                emptyViewController.errorLabel.text = emptyString
                remove(viewControllerToRemove: listViewController)
                remove(viewControllerToRemove: errorViewController)
                remove(viewControllerToRemove: loadingViewController)
                add(asChildViewController: emptyViewController)
            case let .error(errorString):
                errorViewController.errorLabel.text = errorString
                remove(viewControllerToRemove: emptyViewController)
                remove(viewControllerToRemove: listViewController)
                remove(viewControllerToRemove: loadingViewController)
                add(asChildViewController: errorViewController)
            }
        }
    }

    private let loadingViewController = LoadingViewController()
    private let emptyViewController = ErrorViewController()
    private let errorViewController = ErrorViewController()
    private let listViewController = ListViewController()

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        addChild(listViewController)
    }
}

open class MovieListFetcherViewController1: UIViewController {
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

let fetcher = MovieListFetcherViewController1()

PlaygroundPage.current.liveView = fetcher
