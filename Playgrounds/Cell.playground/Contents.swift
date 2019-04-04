import PlaygroundSupport
import UIKit

@testable import MVCMovieInfoFramework

let view = ImageWithFourLabelView(frame: CGRect(x: 0, y: 0, width: 375, height: 150))

view.firstLabel.text = "Titre"
view.secondLabel.text = "Description"
view.thirdLabel.text = "Date"
view.fourthLabel.text = "⭐️"

PlaygroundPage.current.liveView = view
