import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

PlaygroundPage.current.needsIndefiniteExecution = true


let movieFetcher = MovieFetcherViewController()
PlaygroundPage.current.liveView = movieFetcher
