//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//: First we need a `hostView` to put the different elements on.
let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
hostView.backgroundColor = UIColor.black
PlaygroundPage.current.liveView = hostView

let timeLabel = UILabel()
timeLabel.text = "9:41 AM"
timeLabel.textColor = UIColor.white
timeLabel.font = UIFont.boldSystemFont(ofSize: 13)
timeLabel.textAlignment = .center

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
    label.textColor = UIColor.white
    label.font = UIFont.systemFont(ofSize: 12)
    label.textAlignment = .center
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
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
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

let pageControl = UIPageControl()
pageControl.numberOfPages = 3

let safariColumnStackView = appStackViewWithArrangedViews([pageControl, safariStackView])

let firstRowStackView = UIStackView(arrangedSubviews: [firstColumnStackView, secondColumnStackView, mapsStackView, remindersStackView])
firstRowStackView.distribution = .equalSpacing
firstRowStackView.alignment = .top
firstRowStackView.spacing = 15

let topStackView = UIStackView(arrangedSubviews: [timeLabel, firstRowStackView])
topStackView.axis = .vertical
topStackView.spacing = 5

//let bottomStackView = UIStackView(arrangedSubviews: [safariStackView])
//bottomStackView.alignment = .Top
//bottomStackView.distribution = .EqualSpacing

let dockBackgroundView = UIView()
dockBackgroundView.translatesAutoresizingMaskIntoConstraints = false
dockBackgroundView.backgroundColor = UIColor(white: 0.35, alpha: 1.0)

let infoLabel = UILabel()
infoLabel.translatesAutoresizingMaskIntoConstraints = false
infoLabel.textColor = UIColor.gray
infoLabel.text = "Build with UIStackViews"

let mainStackView = UIStackView(arrangedSubviews: [topStackView, safariColumnStackView])
mainStackView.translatesAutoresizingMaskIntoConstraints = false
mainStackView.axis = .vertical
mainStackView.distribution = .equalSpacing
mainStackView.alignment = .center

hostView.addSubview(dockBackgroundView)
hostView.addSubview(mainStackView)
hostView.addSubview(infoLabel)

NSLayoutConstraint.activate(
  [
    mainStackView.leadingAnchor.constraint(equalTo: hostView.leadingAnchor),
    mainStackView.trailingAnchor.constraint(equalTo: hostView.trailingAnchor),
    mainStackView.topAnchor.constraint(equalTo: hostView.topAnchor, constant: 3),
    mainStackView.bottomAnchor.constraint(equalTo: hostView.bottomAnchor, constant: -3),
    dockBackgroundView.leadingAnchor.constraint(equalTo: hostView.leadingAnchor),
    dockBackgroundView.trailingAnchor.constraint(equalTo: hostView.trailingAnchor),
    dockBackgroundView.bottomAnchor.constraint(equalTo: hostView.bottomAnchor),
    dockBackgroundView.heightAnchor.constraint(equalToConstant: 95),
    infoLabel.centerXAnchor.constraint(equalTo: hostView.centerXAnchor),
    infoLabel.centerYAnchor.constraint(equalTo: hostView.centerYAnchor),
    
    calendarImageView.widthAnchor.constraint(equalToConstant: 60),
    calendarImageView.heightAnchor.constraint(equalToConstant: 60),
    
    photosImageView.widthAnchor.constraint(equalToConstant: 60),
    photosImageView.heightAnchor.constraint(equalToConstant: 60),
    mapsImageView.widthAnchor.constraint(equalToConstant: 60),
    mapsImageView.heightAnchor.constraint(equalToConstant: 60),
    remindersImageView.widthAnchor.constraint(equalToConstant: 60),
    remindersImageView.heightAnchor.constraint(equalToConstant: 60),
    healthImageView.widthAnchor.constraint(equalToConstant: 60),
    healthImageView.heightAnchor.constraint(equalToConstant: 60),
    settingsImageView.widthAnchor.constraint(equalToConstant: 60),
    settingsImageView.heightAnchor.constraint(equalToConstant: 60),
    safariImageView.widthAnchor.constraint(equalToConstant: 60),
    safariImageView.heightAnchor.constraint(equalToConstant: 60),
  ])

//: [Next](@next)
