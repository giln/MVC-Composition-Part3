import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

PlaygroundPage.current.needsIndefiniteExecution = true

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
} 

let movieListCoordinator = MovieListCoordinator()
movieListCoordinator.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)

let searchController = MovieSearchViewController()
searchController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
let navBar = UINavigationController(rootViewController: searchController)

let tabbarController = UITabBarController()
tabbarController.viewControllers = [movieListCoordinator, navBar]


PlaygroundPage.current.liveView = tabbarController
