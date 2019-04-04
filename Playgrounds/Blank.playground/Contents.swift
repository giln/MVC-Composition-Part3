import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

PlaygroundPage.current.needsIndefiniteExecution = true

public protocol Listable {
    var firstText: String { get }
    var secondText: String { get }
    var thirdText: String { get }
    var fourthText: String { get }
    var imageUrl: URL { get }
}

public extension ImageWithFourLabelView {
    func configure(with element: Listable) {
        firstLabel.text = element.firstText
        secondLabel.text = element.secondText
        thirdLabel.text = element.thirdText
        fourthLabel.text = element.fourthText
        imageView.url = element.imageUrl
    }
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
        cell.layout.configure(with: element)

        return cell
    }
}

let listController = ListViewController()

extension Movie: Listable {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    public var firstText: String {
        return title
    }

    public var secondText: String {
        return overview
    }

    public var thirdText: String {
        return Movie.dateFormatter.string(from: releaseDate)
    }

    public var fourthText: String {
        let rating = Int(voteAverage)
        let ratingText = (0 ..< rating).reduce("") { (acc, _) -> String in
            return acc + "⭐️"
        }
        return ratingText
    }

    public var imageUrl: URL {
        return posterURL
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
