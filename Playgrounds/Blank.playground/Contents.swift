import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

PlaygroundPage.current.needsIndefiniteExecution = true

public protocol Listable {
    var title: String { get }
}

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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.defaultReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - TableViewDataSource

    open override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return list.count
    }

    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.defaultReuseIdentifier, for: indexPath)

        let element = list[indexPath.row]
        cell.textLabel?.text = element.title

        return cell
    }
}

let listController = ListViewController()

extension Movie: Listable {

}

let movieStore = MovieStore.shared

movieStore.fetchMovies(from: .topRated, params: nil, successHandler: { moviesResponse in
    print(moviesResponse)
    listController.list = moviesResponse.results
}) { error in
    print(error)
}

PlaygroundPage.current.liveView = listController
