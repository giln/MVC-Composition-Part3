//
//  UIViewController+Anchor.swift
//  Tools
//
//  Created by Gil Nakache on 26/10/2017.
//  Copyright © 2016 Viseo. All rights reserved.
//

import UIKit

/// Extension to simplify autolayout anchoring of views in a ViewController
public extension UIViewController {
    /// Adds a view as a subview to the main view
    ///
    /// - Parameters:
    ///   - anchoredView: the view to anchor
    ///   - useSafeAnchor: should the view be anchored to the safeAreaLayoutGuide
    func anchor(view anchoredView: UIView, useSafeAnchors: Bool = true) {
        anchoredView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            anchoredView.topAnchor.constraint(equalTo: useSafeAnchors ? view.safeTopAnchor : view.topAnchor).isActive = true
        } else {
            anchoredView.topAnchor.constraint(equalTo: useSafeAnchors ? view.safeTopAnchor : topLayoutGuide.bottomAnchor).isActive = true
        }

        anchoredView.leadingAnchor.constraint(equalTo: useSafeAnchors ? view.safeLeadingAnchor : view.leadingAnchor).isActive = true
        anchoredView.trailingAnchor.constraint(equalTo: useSafeAnchors ? view.safeTrailingAnchor : view.trailingAnchor).isActive = true
        if #available(iOS 11, *) {
            anchoredView.bottomAnchor.constraint(equalTo: useSafeAnchors ? view.safeBottomAnchor : view.bottomAnchor).isActive = true
        } else {
            anchoredView.bottomAnchor.constraint(equalTo: useSafeAnchors ? view.safeBottomAnchor : bottomLayoutGuide.topAnchor).isActive = true
        }
    }
}

