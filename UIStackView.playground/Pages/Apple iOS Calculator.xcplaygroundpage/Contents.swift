//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 500))
hostView.backgroundColor = .black
PlaygroundPage.current.liveView = hostView

func makeButtonWith(title: String, selector: String, tag: Int) -> UIButton {
    let button = UIButton(type: .system)
    button.tintColor = UIColor.black
    switch tag {
    case 0...10:
        button.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
    case 101...110:
        button.backgroundColor = UIColor.orange
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 50)
    default:
        button.backgroundColor = UIColor(white: 0.90, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 25)
    }
    button.setTitle(title, for: UIControl.State.normal)
    button.tag = tag
    return button
}

let makeView = { (color: UIColor) -> UIView in
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
}

let zeroButton  = makeButtonWith(title: "0", selector: "", tag: 0)
let dotButton   = makeButtonWith(title: ",", selector: "", tag: 10)
let equalButton = makeButtonWith(title: "=", selector: "", tag: 101)
let oneButton   = makeButtonWith(title: "1", selector: "", tag: 1)
let twoButton   = makeButtonWith(title: "2", selector: "", tag: 2)
let threeButton = makeButtonWith(title: "3", selector: "", tag: 3)
let plusButton  = makeButtonWith(title: "+", selector: "", tag: 102)
let fourButton  = makeButtonWith(title: "4", selector: "", tag: 4)
let fiveButton  = makeButtonWith(title: "5", selector: "", tag: 5)
let sixButton   = makeButtonWith(title: "6", selector: "", tag: 6)
let minusButton = makeButtonWith(title: "−", selector: "", tag: 103)
let sevenButton = makeButtonWith(title: "7", selector: "", tag: 7)
let eighyButton = makeButtonWith(title: "8", selector: "", tag: 8)
let nineButton  = makeButtonWith(title: "9", selector: "", tag: 9)
let timesButton = makeButtonWith(title: "×", selector: "", tag: 104)
let tanButton   = makeButtonWith(title: "C", selector: "", tag: 100)
let openParenthesesButton = makeButtonWith(title: "±", selector: "", tag: 100)
let closeParenthesesButton = makeButtonWith(title: "%", selector: "", tag: 100)
let divideButton = makeButtonWith(title: "÷", selector: "", tag: 105)

let textView = UILabel(frame: .zero)
textView.translatesAutoresizingMaskIntoConstraints = false
textView.text = "42"
textView.font = UIFont(name: "HelveticaNeue-Thin", size: 60)
//textView.backgroundColor = UIColor.redColor()
textView.textColor = UIColor.white
textView.textAlignment = .right

let textHostView = UIView(frame: .zero)
textHostView.backgroundColor = UIColor.black
textHostView.addSubview(textView)

NSLayoutConstraint.activate(
  [
    textView.bottomAnchor.constraint(equalTo: textHostView.bottomAnchor, constant: -5),
    textView.leadingAnchor.constraint(equalTo: textHostView.leadingAnchor, constant: 5),
    textView.trailingAnchor.constraint(equalTo: textHostView.trailingAnchor, constant: -5),
    ])

//let redView = makeView(.redColor())
//let blueView = makeView(.blueColor())
//let greenView = makeView(.greenColor())

let firstRow = UIStackView(arrangedSubviews: [zeroButton, dotButton, equalButton])
firstRow.distribution = .fillProportionally
firstRow.spacing = 0.5

NSLayoutConstraint.activate(
  [
    zeroButton.widthAnchor.constraint(equalTo: dotButton.widthAnchor, multiplier: 2.0, constant: 0.5),
    dotButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
  ])

let secondRow = UIStackView(arrangedSubviews: [oneButton, twoButton, threeButton, plusButton])
secondRow.distribution = .fillEqually
secondRow.spacing = 0.5

let thirdRow = UIStackView(arrangedSubviews: [fourButton, fiveButton, sixButton, minusButton])
thirdRow.distribution = .fillEqually
thirdRow.spacing = 0.5

let fourthRow = UIStackView(arrangedSubviews: [sevenButton, eighyButton, nineButton, timesButton])
fourthRow.distribution = .fillEqually
fourthRow.spacing = 0.5

let fifthRow = UIStackView(arrangedSubviews: [tanButton, openParenthesesButton, closeParenthesesButton, divideButton])
fifthRow.distribution = .fillEqually
fifthRow.spacing = 0.5

let buttonStackView = UIStackView(arrangedSubviews: [fifthRow, fourthRow, thirdRow, secondRow, firstRow])
buttonStackView.axis = .vertical
buttonStackView.distribution = .fillEqually
buttonStackView.spacing = 0.5

let hostStackView = UIStackView(arrangedSubviews: [textHostView, buttonStackView])
hostStackView.frame = hostView.bounds
hostStackView.axis = .vertical
//  hostStackView.distribution = .FillEqually
hostStackView.spacing = 0.5

textHostView.heightAnchor.constraint(equalToConstant: 150).isActive = true

hostView.addSubview(hostStackView)

hostView


//: [Next](@next)
