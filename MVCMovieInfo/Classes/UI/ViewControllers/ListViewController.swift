//
//  ListViewController.swift
//  MVCMovieInfo
//
//  Created by Gil Nakache on 04/04/2019.
//  Copyright © 2019 viseo. All rights reserved.
//

import UIKit

open class ListViewController: UITableViewController {
    // MARK: - Variables

    open var list = [Listable]() {
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
        tableView.register(ImageWithFourLabelCell.self, forCellReuseIdentifier: ImageWithFourLabelCell.defaultReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - TableViewDataSource

    open override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return list.count
    }

    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageWithFourLabelCell.defaultReuseIdentifier, for: indexPath) as! ImageWithFourLabelCell

        let element = list[indexPath.row]
        cell.layout.configure(with: element)

        return cell
    }
}
