//: [Previous](@previous)

import UIKit
import XCPlayground

//: First we need a `hostView` to put the different elements on.
let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 110))
hostView.backgroundColor = UIColor.whiteColor()
XCPShowView("hostView", view: hostView)

let avatarImageView = UIImageView(image: UIImage(named: "IMG_0345.jpg"))
avatarImageView.clipsToBounds = true
avatarImageView.backgroundColor = UIColor.yellowColor()
avatarImageView.contentMode = .ScaleAspectFill
avatarImageView.layer.cornerRadius = 5

let handleLabel = UILabel(frame: CGRect.zeroRect)
handleLabel.text = "dasdom"
handleLabel.font = UIFont(name: "Avenir-Heavy", size: 13)
//handleLabel.backgroundColor = UIColor.redColor()

let dateLabel = UILabel(frame: CGRect.zeroRect)
dateLabel.text = "06/26/2015"
dateLabel.font = UIFont(name: "Avenir-Book", size: 13)
//dateLabel.backgroundColor = UIColor.grayColor()

let textLabel = UILabel(frame: CGRect.zeroRect)
textLabel.text = "I played a bit with UIStackView. I'm loving it. Many layouts will become very easy in iOS 9."
textLabel.numberOfLines = 0
textLabel.font = UIFont(name: "Avenir-Book", size: 14)
//textLabel.backgroundColor = UIColor.yellowColor()

//: This if statement is needed, otherwise the Playground isn't executed.
if #available(iOS 9, *) {
  let metaStackView = UIStackView(arrangedSubviews: [handleLabel, dateLabel])
  metaStackView.spacing = 10
  
  let textStackView = UIStackView(arrangedSubviews: [metaStackView, textLabel])
  textStackView.axis = .Vertical
  textStackView.spacing = 5
  
  let mainStackView = UIStackView(arrangedSubviews: [avatarImageView, textStackView])
  mainStackView.translatesAutoresizingMaskIntoConstraints = false
  mainStackView.alignment = .Top
  mainStackView.spacing = 10
  
  hostView.addSubview(mainStackView)
  
  var constraints = [NSLayoutConstraint]()
  constraints.append(avatarImageView.widthAnchor.constraintEqualToConstant(60))
  constraints.append(avatarImageView.heightAnchor.constraintEqualToConstant(60))
  
  constraints.append(mainStackView.topAnchor.constraintEqualToAnchor(hostView.topAnchor, constant: 10))
  constraints.append(mainStackView.bottomAnchor.constraintEqualToAnchor(hostView.bottomAnchor, constant: -10))
  constraints.append(mainStackView.leadingAnchor.constraintEqualToAnchor(hostView.leadingAnchor, constant: 10))
  constraints.append(mainStackView.trailingAnchor.constraintEqualToAnchor(hostView.trailingAnchor, constant: -10))
  
  NSLayoutConstraint.activateConstraints(constraints)
}

//: [Next](@next)
