import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}


let movieListCoordinator = MovieListCoordinator()
PlaygroundPage.current.liveView = movieListCoordinator
