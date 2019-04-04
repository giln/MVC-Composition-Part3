import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}



let movieFetcher = MovieListFetcherViewController()

movieFetcher.endpoint = .topRated

PlaygroundPage.current.liveView = movieFetcher
