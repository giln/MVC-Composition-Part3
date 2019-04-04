import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

PlaygroundPage.current.needsIndefiniteExecution = true


let listController = ListViewController()

let movieStore = MovieStore.shared

movieStore.fetchMovies(from: .topRated, params: nil, successHandler: { moviesResponse in
    print(moviesResponse)
    listController.list = moviesResponse.results
}) { error in
    print(error)
}

PlaygroundPage.current.liveView = listController
