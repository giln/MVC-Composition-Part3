import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}



let topRated = MovieListFetcherViewController()
topRated.endpoint = .topRated
let popular = MovieListFetcherViewController()
popular.endpoint = .popular
let nowPlaying = MovieListFetcherViewController()
nowPlaying.endpoint = .nowPlaying
let upcoming = MovieListFetcherViewController()
upcoming.endpoint = .upcoming

let segmentedController = SegmentedViewController()

segmentedController.items = [topRated, popular, nowPlaying, upcoming]

PlaygroundPage.current.liveView = segmentedController
