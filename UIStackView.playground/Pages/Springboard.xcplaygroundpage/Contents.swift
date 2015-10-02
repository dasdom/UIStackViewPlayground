//: [Previous](@previous)

import UIKit
import XCPlayground

//: First we need a `hostView` to put the different elements on.
let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
hostView.backgroundColor = .blackColor()
XCPShowView("hostView", view: hostView)

let timeLabel = UILabel()
timeLabel.text = "9:41 AM"
timeLabel.textColor = .whiteColor()
timeLabel.font = UIFont.boldSystemFontOfSize(13)
timeLabel.textAlignment = .Center

let calendarImageView = UIImageView(image: UIImage(named: "calendar"))
let photosImageView = UIImageView(image: UIImage(named: "photos"))
let mapsImageView = UIImageView(image: UIImage(named: "maps"))
let remindersImageView = UIImageView(image: UIImage(named: "notes"))
let healthImageView = UIImageView(image: UIImage(named: "health"))
let settingsImageView = UIImageView(image: UIImage(named: "settings"))
let safariImageView = UIImageView(image: UIImage(named: "safari"))

let labelWithText = { (text: String) -> UILabel in
    let label = UILabel()
    label.text = text
    label.textColor = .whiteColor()
    label.font = UIFont.systemFontOfSize(12)
    label.textAlignment = .Center
    return label
}

let calendarLabel = labelWithText("Calendar")
let photosLabel = labelWithText("Photos")
let mapsLabel = labelWithText("Maps")
let remindersLabel = labelWithText("Reminders")
let healthLabel = labelWithText("Health")
let settingsLabel = labelWithText("Settings")
let safariLabel = labelWithText("Safari")


let appStackViewWithArrangedViews = { (views: [UIView]) -> UIStackView in
    let stackView = UIStackView(arrangedSubviews: views)
    stackView.axis = .Vertical
    stackView.distribution = .EqualSpacing
    stackView.spacing = 3
    return stackView
}

let calendarStackView = appStackViewWithArrangedViews([calendarImageView, calendarLabel])
let photosStackView = appStackViewWithArrangedViews([photosImageView, photosLabel])
let mapsStackView = appStackViewWithArrangedViews([mapsImageView, mapsLabel])
let remindersStackView = appStackViewWithArrangedViews([remindersImageView, remindersLabel])
let healthStackView = appStackViewWithArrangedViews([healthImageView, healthLabel])
let settingsStackView = appStackViewWithArrangedViews([settingsImageView, settingsLabel])
let safariStackView = appStackViewWithArrangedViews([safariImageView, safariLabel])

let firstColumnStackView = appStackViewWithArrangedViews([calendarStackView, healthStackView])
firstColumnStackView.spacing = 10
let secondColumnStackView = appStackViewWithArrangedViews([photosStackView, settingsStackView])
secondColumnStackView.spacing = 10

let firstRowStackView = UIStackView(arrangedSubviews: [firstColumnStackView, secondColumnStackView, mapsStackView, remindersStackView])
firstRowStackView.distribution = .EqualSpacing
firstRowStackView.alignment = .Top
firstRowStackView.spacing = 15

let topStackView = UIStackView(arrangedSubviews: [timeLabel, firstRowStackView])
topStackView.axis = .Vertical
topStackView.spacing = 5

//let bottomStackView = UIStackView(arrangedSubviews: [safariStackView])
//bottomStackView.alignment = .Top
//bottomStackView.distribution = .EqualSpacing

let dockBackgroundView = UIView()
dockBackgroundView.translatesAutoresizingMaskIntoConstraints = false
dockBackgroundView.backgroundColor = UIColor(white: 0.35, alpha: 1.0)

let mainStackView = UIStackView(arrangedSubviews: [topStackView, safariStackView])
mainStackView.translatesAutoresizingMaskIntoConstraints = false
mainStackView.axis = .Vertical
mainStackView.distribution = .EqualSpacing
mainStackView.alignment = .Center

hostView.addSubview(dockBackgroundView)
hostView.addSubview(mainStackView)

let views = ["stackView": mainStackView, "dockBackground": dockBackgroundView]
var layoutConstraints = [NSLayoutConstraint]()
layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|[stackView]|", options: [], metrics: nil, views: views)
layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-3-[stackView]-3-|", options: [], metrics: nil, views: views)
layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|[dockBackground]|", options: [], metrics: nil, views: views)
layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:[dockBackground(95)]|", options: [], metrics: nil, views: views)

layoutConstraints.append(calendarImageView.widthAnchor.constraintEqualToConstant(60))
layoutConstraints.append(calendarImageView.heightAnchor.constraintEqualToConstant(60))
layoutConstraints.append(photosImageView.widthAnchor.constraintEqualToConstant(60))
layoutConstraints.append(photosImageView.heightAnchor.constraintEqualToConstant(60))
layoutConstraints.append(mapsImageView.widthAnchor.constraintEqualToConstant(60))
layoutConstraints.append(mapsImageView.heightAnchor.constraintEqualToConstant(60))
layoutConstraints.append(remindersImageView.widthAnchor.constraintEqualToConstant(60))
layoutConstraints.append(remindersImageView.heightAnchor.constraintEqualToConstant(60))
layoutConstraints.append(healthImageView.widthAnchor.constraintEqualToConstant(60))
layoutConstraints.append(healthImageView.heightAnchor.constraintEqualToConstant(60))
layoutConstraints.append(settingsImageView.widthAnchor.constraintEqualToConstant(60))
layoutConstraints.append(settingsImageView.heightAnchor.constraintEqualToConstant(60))
layoutConstraints.append(safariImageView.widthAnchor.constraintEqualToConstant(60))
layoutConstraints.append(safariImageView.heightAnchor.constraintEqualToConstant(60))

NSLayoutConstraint.activateConstraints(layoutConstraints)

//: [Next](@next)
