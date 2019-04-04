//
//  ListStateViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class ListStateViewController: UIViewController {
    public enum State {
        case loading
        case list([Listable])
        case empty(String)
        case error(String)
    }

    // MARK: - Variables

    public var state = State.empty("") {
        didSet {
            switch state {
            case .loading:
                remove(viewControllerToRemove: emptyViewController)
                remove(viewControllerToRemove: errorViewController)
                remove(viewControllerToRemove: listViewController)
                add(asChildViewController: loadingViewController)
            case let .list(list):
                listViewController.list = list
                remove(viewControllerToRemove: emptyViewController)
                remove(viewControllerToRemove: errorViewController)
                remove(viewControllerToRemove: loadingViewController)
                add(asChildViewController: listViewController)
            case let .empty(emptyString):
                emptyViewController.errorLabel.text = emptyString
                remove(viewControllerToRemove: listViewController)
                remove(viewControllerToRemove: errorViewController)
                remove(viewControllerToRemove: loadingViewController)
                add(asChildViewController: emptyViewController)
            case let .error(errorString):
                errorViewController.errorLabel.text = errorString
                remove(viewControllerToRemove: emptyViewController)
                remove(viewControllerToRemove: listViewController)
                remove(viewControllerToRemove: loadingViewController)
                add(asChildViewController: errorViewController)
            }
        }
    }

    private let loadingViewController = LoadingViewController()
    private let emptyViewController = ErrorViewController()
    private let errorViewController = ErrorViewController()
    private let listViewController = ListViewController()

    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        addChild(listViewController)
    }
}
