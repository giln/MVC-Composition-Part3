import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

let movieCoordinator = MovieListCoordinator()

PlaygroundPage.current.liveView = movieCoordinator
