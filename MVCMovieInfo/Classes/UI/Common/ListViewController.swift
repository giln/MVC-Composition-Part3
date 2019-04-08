//
//  ListViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class ListViewController<ContentView: Configurable>: UITableViewController {
    // MARK: - Variables

    open var list = [ContentView.Element]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(ListCell<ContentView>.self, forCellReuseIdentifier: ListCell<ContentView>.defaultReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - TableViewDataSource

    open override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return list.count
    }

    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // !!! This warning is wrong !!! The type casting does not fail!
        // The warning should hopefully go away in newer swift versions
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell<ContentView>.defaultReuseIdentifier, for: indexPath) as! ListCell<ContentView>

        let element = list[indexPath.row]

        cell.content.configure(with: element)

        return cell
    }
}
