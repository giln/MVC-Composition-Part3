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

        let viewController = ViewController()
        window?.rootViewController = viewController

        return true
    }
}
