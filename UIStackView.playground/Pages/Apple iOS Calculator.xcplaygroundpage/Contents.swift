//: [Previous](@previous)

import UIKit
import XCPlayground

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 500))
hostView.backgroundColor = .blackColor()
XCPlaygroundPage.currentPage.liveView = hostView

func makeButtonWithTitle(title: String, selector: String, tag: Int) -> UIButton {
    let button = UIButton(type: .System)
    button.tintColor = UIColor.blackColor()
    switch tag {
    case 0...10:
        button.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
    case 101...110:
        button.backgroundColor = UIColor.orangeColor()
        button.tintColor = .whiteColor()
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 50)
    default:
        button.backgroundColor = UIColor(white: 0.90, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 25)
    }
    button.setTitle(title, forState: .Normal)
    button.tag = tag
    return button
}

let makeView = { (color: UIColor) -> UIView in
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
}

let zeroButton  = makeButtonWithTitle("0", selector: "", tag: 0)
let dotButton   = makeButtonWithTitle(",", selector: "", tag: 10)
let equalButton = makeButtonWithTitle("=", selector: "", tag: 101)
let oneButton   = makeButtonWithTitle("1", selector: "", tag: 1)
let twoButton   = makeButtonWithTitle("2", selector: "", tag: 2)
let threeButton = makeButtonWithTitle("3", selector: "", tag: 3)
let plusButton  = makeButtonWithTitle("+", selector: "", tag: 102)
let fourButton  = makeButtonWithTitle("4", selector: "", tag: 4)
let fiveButton  = makeButtonWithTitle("5", selector: "", tag: 5)
let sixButton   = makeButtonWithTitle("6", selector: "", tag: 6)
let minusButton = makeButtonWithTitle("−", selector: "", tag: 103)
let sevenButton = makeButtonWithTitle("7", selector: "", tag: 7)
let eighyButton = makeButtonWithTitle("8", selector: "", tag: 8)
let nineButton  = makeButtonWithTitle("9", selector: "", tag: 9)
let timesButton = makeButtonWithTitle("×", selector: "", tag: 104)
let tanButton   = makeButtonWithTitle("C", selector: "", tag: 100)
let openParenthesesButton = makeButtonWithTitle("±", selector: "", tag: 100)
let closeParenthesesButton = makeButtonWithTitle("%", selector: "", tag: 100)
let divideButton = makeButtonWithTitle("÷", selector: "", tag: 105)

let textView = UILabel(frame: .zero)
textView.translatesAutoresizingMaskIntoConstraints = false
textView.text = "42"
textView.font = UIFont(name: "HelveticaNeue-Thin", size: 60)
//textView.backgroundColor = UIColor.redColor()
textView.textColor = .whiteColor()
textView.textAlignment = .Right

let textHostView = UIView(frame: .zero)
textHostView.backgroundColor = .blackColor()
textHostView.addSubview(textView)

var constraints = [NSLayoutConstraint]()

constraints.append(textView.bottomAnchor.constraintEqualToAnchor(textHostView.bottomAnchor, constant: -5))
constraints.append(textView.leadingAnchor.constraintEqualToAnchor(textHostView.leadingAnchor, constant: 5))
constraints.append(textView.trailingAnchor.constraintEqualToAnchor(textHostView.trailingAnchor, constant: -5))

NSLayoutConstraint.activateConstraints(constraints)

//let redView = makeView(.redColor())
//let blueView = makeView(.blueColor())
//let greenView = makeView(.greenColor())

let firstRow = UIStackView(arrangedSubviews: [zeroButton, dotButton, equalButton])
firstRow.distribution = .FillProportionally
firstRow.spacing = 0.5

zeroButton.widthAnchor.constraintEqualToAnchor(dotButton.widthAnchor, multiplier: 2.0, constant: 0.5).active = true
dotButton.widthAnchor.constraintEqualToAnchor(equalButton.widthAnchor).active = true

let secondRow = UIStackView(arrangedSubviews: [oneButton, twoButton, threeButton, plusButton])
secondRow.distribution = .FillEqually
secondRow.spacing = 0.5

let thirdRow = UIStackView(arrangedSubviews: [fourButton, fiveButton, sixButton, minusButton])
thirdRow.distribution = .FillEqually
thirdRow.spacing = 0.5

let fourthRow = UIStackView(arrangedSubviews: [sevenButton, eighyButton, nineButton, timesButton])
fourthRow.distribution = .FillEqually
fourthRow.spacing = 0.5

let fifthRow = UIStackView(arrangedSubviews: [tanButton, openParenthesesButton, closeParenthesesButton, divideButton])
fifthRow.distribution = .FillEqually
fifthRow.spacing = 0.5

let buttonStackView = UIStackView(arrangedSubviews: [fifthRow, fourthRow, thirdRow, secondRow, firstRow])
buttonStackView.axis = .Vertical
buttonStackView.distribution = .FillEqually
buttonStackView.spacing = 0.5

let hostStackView = UIStackView(arrangedSubviews: [textHostView, buttonStackView])
hostStackView.frame = hostView.bounds
hostStackView.axis = .Vertical
//  hostStackView.distribution = .FillEqually
hostStackView.spacing = 0.5

textHostView.heightAnchor.constraintEqualToConstant(150).active = true

hostView.addSubview(hostStackView)

hostView


//: [Next](@next)
