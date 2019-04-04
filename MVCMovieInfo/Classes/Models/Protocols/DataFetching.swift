//
//  DataFetching.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 29/03/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import Foundation

public protocol DataFetching {
    func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void)
}

extension DataFetching {
    public func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void) {

        let session = URLSession.shared

        session.dataTask(with: url) { (data, response, error) in
            completion(data, error)
            }.resume()

    }
}
