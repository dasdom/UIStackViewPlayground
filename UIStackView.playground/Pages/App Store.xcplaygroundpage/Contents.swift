//: [Previous](@previous)

import UIKit
import XCPlayground

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
hostView.backgroundColor = UIColor.whiteColor()
XCPShowView("hostView", view: hostView)

let makeView = { (color: UIColor) -> UIView in
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
}

let iconImageView = UIImageView(image: UIImage(named: "IconFojusi"))
iconImageView.layer.cornerRadius = 20
iconImageView.clipsToBounds = true

let appNameLabel = UILabel(frame: .zero)
appNameLabel.font = UIFont.boldSystemFontOfSize(15)
appNameLabel.text = "Fojusi"
appNameLabel.backgroundColor = .yellowColor()

let devNameLabel = UILabel(frame: .zero)
devNameLabel.font = UIFont.systemFontOfSize(13)
devNameLabel.text = "Dominik Hauser"
devNameLabel.backgroundColor = .redColor()

let buyButton = UIButton(type: .System)
buyButton.setTitle("0,99 €", forState: .Normal)
buyButton.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
buyButton.layer.cornerRadius = 5
buyButton.layer.borderColor = buyButton.tintColor.CGColor
buyButton.layer.borderWidth = 1

let headerView = UIView(frame: .zero)
//headerView.backgroundColor = UIColor.brownColor()

let metaDataStackView = UIStackView(arrangedSubviews: [appNameLabel, devNameLabel])
metaDataStackView.axis = .Vertical

let leftHeaderStackView = UIStackView(arrangedSubviews: [metaDataStackView, buyButton])
leftHeaderStackView.axis = .Vertical
leftHeaderStackView.distribution = UIStackViewDistribution.EqualCentering

let headerStackView = UIStackView(arrangedSubviews: [iconImageView, leftHeaderStackView])
headerStackView.translatesAutoresizingMaskIntoConstraints = false
//  headerStackView.alignment = .Top
headerStackView.layoutMarginsRelativeArrangement = true
headerStackView.spacing = 10
headerView.addSubview(headerStackView)

let mainStackView = UIStackView(arrangedSubviews: [headerView])
mainStackView.translatesAutoresizingMaskIntoConstraints = false
hostView.addSubview(mainStackView)

let views = ["mainStackView": mainStackView, "headerStackView": headerStackView]
var constraints = [NSLayoutConstraint]()
constraints += NSLayoutConstraint.constraintsWithVisualFormat("|[mainStackView]|", options: [], metrics: nil, views: views)
constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[mainStackView]|", options: [], metrics: nil, views: views)
constraints += NSLayoutConstraint.constraintsWithVisualFormat("|-10-[headerStackView]-10-|", options: [], metrics: nil, views: views)
constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[headerStackView]", options: [], metrics: nil, views: views)
constraints.append(iconImageView.widthAnchor.constraintEqualToConstant(100))
constraints.append(iconImageView.heightAnchor.constraintEqualToConstant(100))
NSLayoutConstraint.activateConstraints(constraints)


//: [Next](@next)
