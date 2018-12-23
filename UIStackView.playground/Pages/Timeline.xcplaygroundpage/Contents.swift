//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//: First we need a `hostView` to put the different elements on.
let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 130))
hostView.backgroundColor = .white
PlaygroundPage.current.liveView = hostView

let avatarImageView = UIImageView(image: UIImage(named: "IMG_0345.jpg"))
avatarImageView.clipsToBounds = true
avatarImageView.backgroundColor = .yellow
avatarImageView.contentMode = .scaleAspectFill
avatarImageView.layer.cornerRadius = 5

let handleLabel = UILabel(frame: .zero)
handleLabel.text = "dasdom"
handleLabel.font = UIFont(name: "Avenir-Heavy", size: 13)
//handleLabel.backgroundColor = UIColor.redColor()

let dateLabel = UILabel(frame: .zero)
dateLabel.text = "06/26/2015"
dateLabel.font = UIFont(name: "Avenir-Book", size: 13)
//dateLabel.backgroundColor = UIColor.grayColor()

let textLabel = UILabel(frame: .zero)
let textWithoutLink = "I played a bit with UIStackView. Good stuff!\nExamples: "
let linkString = "https://github.com/dasdom/UIStackViewPlayground"
let tweetString = textWithoutLink + linkString
let attributedString = NSMutableAttributedString(string: tweetString, attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir-Book", size: 14)!])
attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.1, green: 0.1, blue: 1.0, alpha: 1.0), range: NSMakeRange(textWithoutLink.count, linkString.count))

textLabel.attributedText = attributedString
textLabel.numberOfLines = 0
//textLabel.backgroundColor = UIColor.yellowColor()

let metaStackView = UIStackView(arrangedSubviews: [handleLabel, dateLabel])
metaStackView.spacing = 10

let textStackView = UIStackView(arrangedSubviews: [metaStackView, textLabel])
textStackView.axis = .vertical
textStackView.spacing = 5

let mainStackView = UIStackView(arrangedSubviews: [avatarImageView, textStackView])
mainStackView.translatesAutoresizingMaskIntoConstraints = false
mainStackView.alignment = .top
mainStackView.spacing = 10

hostView.addSubview(mainStackView)

NSLayoutConstraint.activate(
  [
    avatarImageView.widthAnchor.constraint(equalToConstant: 60),
    avatarImageView.heightAnchor.constraint(equalToConstant: 60),
    mainStackView.topAnchor.constraint(equalTo: hostView.topAnchor, constant: 10),
    mainStackView.bottomAnchor.constraint(equalTo: hostView.bottomAnchor, constant: -10),
    mainStackView.leadingAnchor.constraint(equalTo: hostView.leadingAnchor, constant: 10),
    mainStackView.trailingAnchor.constraint(equalTo: hostView.trailingAnchor, constant: -10),
    ])

var constraints = [NSLayoutConstraint]()
//constraints.append(avatarImageView.widthAnchor.constraint(equalToConstant: 60))
//constraints.append(avatarImageView.heightAnchor.constraint(equalToConstant: 60))

//constraints.append(mainStackView.topAnchor.constraint(equalTo: hostView.topAnchor, constant: 10))
//constraints.append(mainStackView.bottomAnchor.constraint(equalTo: hostView.bottomAnchor, constant: -10))
//constraints.append(mainStackView.leadingAnchor.constraint(equalTo: hostView.leadingAnchor, constant: 10))
//constraints.append(mainStackView.trailingAnchor.constraint(equalTo: hostView.trailingAnchor, constant: -10))

NSLayoutConstraint.activate(constraints)


//: [Next](@next)
