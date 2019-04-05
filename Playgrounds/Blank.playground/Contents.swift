import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
} 


let movieSearch = MovieSearchViewController()
let navigationController = UINavigationController(rootViewController: movieSearch)

PlaygroundPage.current.liveView = navigationController
