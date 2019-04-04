//
//  AppDelegate.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 29/03/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        let listController = ListViewController()

        let movieStore = MovieStore.shared

        movieStore.fetchMovies(from: .topRated, params: nil, successHandler: { moviesResponse in
            print(moviesResponse)
            listController.list = moviesResponse.results
        }) { error in
            print(error)
        }

        window?.rootViewController = listController

        return true
    }
}
