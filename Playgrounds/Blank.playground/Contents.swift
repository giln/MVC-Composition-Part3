import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

PlaygroundPage.current.needsIndefiniteExecution = true

public protocol Listable {
    var title: String { get }
    var longtext: String { get }
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
        cell.layout.firstLabel.text = element.title
        cell.layout.secondLabel.text = element.longtext

        return cell
    }
}

let listController = ListViewController()

extension Movie: Listable {
    public var longtext: String {
        return overview
    }
}

let movieStore = MovieStore.shared

movieStore.fetchMovies(from: .topRated, params: nil, successHandler: { moviesResponse in
    print(moviesResponse)
    listController.list = moviesResponse.results
}) { error in
    print(error)
}

PlaygroundPage.current.liveView = listController
