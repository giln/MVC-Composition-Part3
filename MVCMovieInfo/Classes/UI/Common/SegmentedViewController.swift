//
//  SegmentedViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class SegmentedViewController: UIViewController {

    public private(set) var selectedViewControllerIndex = 0

    // MARK: - Public variables

    /// List of ViewControllers. View Controller Titles are used as segment titles.
    public var items = [UIViewController]() {
        didSet {
            // Remove previous viewControllers
            for previousItem in oldValue {
                self.remove(viewControllerToRemove: previousItem)
            }
            // Remove segments
            segmentedControl.removeAllSegments()

            // Add new segments and first viewController
            for (index, item) in items.enumerated() {
                segmentedControl.insertSegment(withTitle: item.title, at: index, animated: false)

                if index == selectedViewControllerIndex {
                    segmentedControl.selectedSegmentIndex = selectedViewControllerIndex
                    add(asChildViewController: item, anchored: true, subview: containerView)
                }
            }
        }
    }

    // MARK: - Private variables

    private let segmentedControl = UISegmentedControl()
    private let containerView = UIView()
    private let stackView = UIStackView()
    private let topStackView = UIStackView()

    // MARK: - LifeCycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        topStackView.axis = .vertical
        topStackView.alignment = .center
        topStackView.distribution = .equalSpacing
        topStackView.isLayoutMarginsRelativeArrangement = true
        topStackView.preservesSuperviewLayoutMargins = true

        view.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5

        view.addSubview(stackView)
        view.anchor(view: stackView, useSafeAnchors: false)

        stackView.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(containerView)

        segmentedControl.addTarget(self, action: #selector(segmentDidChange(segment:)), for: .valueChanged)
    }

    // MARK: - Actions

    @objc
    private func segmentDidChange(segment: UISegmentedControl) {

        selectController(at: segment.selectedSegmentIndex)

        print(segment.selectedSegmentIndex)
    }

    private func selectController(at index: Int ) {

        let item = items[index]

        add(asChildViewController: item, anchored: true, subview: containerView)
        remove(viewControllerToRemove: items[selectedViewControllerIndex])
        selectedViewControllerIndex = index
    }
}
