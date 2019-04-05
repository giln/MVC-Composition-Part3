//
//  DownloadImageView.swift
//  AppStoreViewer
//
//  Created by Gil Nakache on 24/10/2018.
//  Copyright © 2018 Viseo. All rights reserved.
//

import UIKit

public class DownloadImageView: UIImageView, DataFetching {

    // MARK: - Variables

    public var placeHolder: UIImage?

    public var url: URL? {
        didSet {
            image = placeHolder
            if let downloadURL = url {
                fetchData(url: downloadURL) { data, _ in

                    guard let data = data else {
                        DispatchQueue.main.async {
                            self.image = self.placeHolder
                        }
                        return
                    }

                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        // On vérifie que l'URL n'a pas changé
                        if downloadURL == self.url {
                            self.image = image
                        }
                    }
                }
            }
        }
    }
}
