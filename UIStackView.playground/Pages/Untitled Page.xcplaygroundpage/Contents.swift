//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = UIColor.brown

let array = [["one", "1"],["two", "2"],["three", "3"],["four", "4"], ["five", "5"]]

var stackViews = [UIStackView]()
for texts in array {
  let labelA = UILabel()
  labelA.text = texts.first
  labelA.backgroundColor = UIColor.red
  
  let labelB = UILabel()
  labelB.text = texts.last
  labelB.backgroundColor = UIColor.yellow

  let stackView = UIStackView(arrangedSubviews: [labelA, labelB])
  stackView.distribution = .fillEqually
  stackView.axis = .horizontal
//  stackView.alignment = .Fill

  stackViews.append(stackView)
}

let stackView = UIStackView(arrangedSubviews: stackViews)
stackView.translatesAutoresizingMaskIntoConstraints = false
stackView.axis = .vertical
stackView.distribution = .fillEqually
stackView.spacing = 5

view.addSubview(stackView)

let views = ["stackView": stackView]
var layoutConstraints = [NSLayoutConstraint]()
layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[stackView]-|", options: [], metrics: nil, views: views)
layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[stackView]", options: [], metrics: nil, views: views)
NSLayoutConstraint.activate(layoutConstraints)

PlaygroundPage.current.liveView = view

//: [Next](@next)
