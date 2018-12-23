//: [Previous](@previous)

import UIKit
//import XCPlayground
import PlaygroundSupport

//guard #available(iOS 9, *) else { fatalError() }

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 400))
hostView.backgroundColor = .lightGray
PlaygroundPage.current.liveView = hostView

func makeButtonWith(title: String, selector: String, tag: Int) -> UIButton {
  let button = UIButton(type: .system)
  button.backgroundColor = tag < 10 ? UIColor(white: 0.95, alpha: 1.0) : UIColor.white
  button.setTitle(title, for: UIControl.State.normal)
  button.titleLabel?.font = .boldSystemFont(ofSize: 16)
  button.tag = tag
  return button
}

let makeView = { (color: UIColor) -> UIView in
  let view = UIView(frame: .zero)
  view.translatesAutoresizingMaskIntoConstraints = false
  view.backgroundColor = color
  return view
}

let piButton    = makeButtonWith(title: "pi", selector: "", tag: 100)
let eeButton    = makeButtonWith(title: "ee", selector: "", tag: 100)
let zeroButton  = makeButtonWith(title: "0", selector: "", tag: 0)
let dotButton   = makeButtonWith(title: ".", selector: "", tag: 100)
let equalButton = makeButtonWith(title: "=", selector: "", tag: 100)
let powerButton = makeButtonWith(title: "^", selector: "", tag: 100)
let sqrtButton  = makeButtonWith(title: "√", selector: "", tag: 100)
let oneButton   = makeButtonWith(title: "1", selector: "", tag: 1)
let twoButton   = makeButtonWith(title: "2", selector: "", tag: 2)
let threeButton = makeButtonWith(title: "3", selector: "", tag: 3)
let plusButton  = makeButtonWith(title: "+", selector: "", tag: 100)
let log2Button  = makeButtonWith(title: "log2", selector: "", tag: 100)
let log10Button = makeButtonWith(title: "log10", selector: "", tag: 100)
let fourButton  = makeButtonWith(title: "4", selector: "", tag: 4)
let fiveButton  = makeButtonWith(title: "5", selector: "", tag: 5)
let sixButton   = makeButtonWith(title: "6", selector: "", tag: 6)
let minusButton = makeButtonWith(title: "−", selector: "", tag: 100)
let expButton   = makeButtonWith(title: "exp", selector: "", tag: 100)
let lnButton    = makeButtonWith(title: "ln", selector: "", tag: 100)
let sevenButton = makeButtonWith(title: "7", selector: "", tag: 7)
let eighyButton = makeButtonWith(title: "8", selector: "", tag: 8)
let nineButton  = makeButtonWith(title: "9", selector: "", tag: 9)
let timesButton = makeButtonWith(title: "×", selector: "", tag: 100)
let sinButton   = makeButtonWith(title: "sin", selector: "", tag: 100)
let cosButton   = makeButtonWith(title: "cos", selector: "", tag: 100)
let tanButton   = makeButtonWith(title: "tan", selector: "", tag: 100)
let openParenthesesButton = makeButtonWith(title: "(", selector: "", tag: 100)
let closeParenthesesButton = makeButtonWith(title: ")", selector: "", tag: 100)
let divideButton = makeButtonWith(title: "÷", selector: "", tag: 100)
let secondButton = makeButtonWith(title: "2nd", selector: "", tag: 100)
let constButton = makeButtonWith(title: "const", selector: "", tag: 100)
let degButton   = makeButtonWith(title: "deg", selector: "", tag: 100)
let histButton  = makeButtonWith(title: "hist", selector: "", tag: 100)
let ansButton   = makeButtonWith(title: "ans", selector: "", tag: 100)
let delButton   = makeButtonWith(title: "del", selector: "", tag: 100)
let helpButton = makeButtonWith(title: "help", selector: "", tag: 100)
let mailButton = makeButtonWith(title: "mail", selector: "", tag: 100)
let fourtyTwoButton   = makeButtonWith(title: "42", selector: "", tag: 100)
let emptyButton  = makeButtonWith(title: "", selector: "", tag: 100)
let leftArrowButton   = makeButtonWith(title: "←", selector: "", tag: 100)
let rightArrowButton   = makeButtonWith(title: "→", selector: "", tag: 100)

let textView = UITextView(frame: .zero)
textView.translatesAutoresizingMaskIntoConstraints = false
textView.text = "1+2+3×(4-5)+sin(0.6)\n= 0.564642473395035"
textView.font = UIFont(name: "Menlo-Bold", size: 14)

let label = UILabel(frame: .zero)
label.translatesAutoresizingMaskIntoConstraints = false
label.text = " = 0.564642473395035"
label.font = UIFont(name: "Menlo-Bold", size: 14)
label.backgroundColor = UIColor(white: 0.98, alpha: 1.0)

//let redView = makeView(.redColor())
//let blueView = makeView(.blueColor())
//let greenView = makeView(.greenColor())

let firstRow = UIStackView(arrangedSubviews: [piButton, eeButton, zeroButton, dotButton, equalButton])
firstRow.distribution = .fillProportionally
firstRow.spacing = 1

zeroButton.widthAnchor.constraint(equalTo: piButton.widthAnchor, multiplier: 2.0, constant: 1.0).isActive = true
piButton.widthAnchor.constraint(equalTo: eeButton.widthAnchor).isActive = true
piButton.widthAnchor.constraint(equalTo: dotButton.widthAnchor).isActive = true
piButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor).isActive = true

let secondRow = UIStackView(arrangedSubviews: [powerButton, sqrtButton, oneButton, twoButton, threeButton, plusButton])
secondRow.distribution = .fillEqually
secondRow.spacing = 1


let thirdRow = UIStackView(arrangedSubviews: [log2Button, log10Button, fourButton, fiveButton, sixButton, minusButton])
thirdRow.distribution = .fillEqually
thirdRow.spacing = 1

let fourthRow = UIStackView(arrangedSubviews: [expButton, lnButton, sevenButton, eighyButton, nineButton, timesButton])
fourthRow.distribution = .fillEqually
fourthRow.spacing = 1

let fifthRow = UIStackView(arrangedSubviews: [sinButton, cosButton, tanButton, openParenthesesButton, closeParenthesesButton, divideButton])
fifthRow.distribution = .fillEqually
fifthRow.spacing = 1

let sixthRow = UIStackView(arrangedSubviews: [secondButton, constButton, degButton, histButton, ansButton, delButton])
sixthRow.distribution = .fillEqually
sixthRow.spacing = 1

let seventhRow = UIStackView(arrangedSubviews: [helpButton, mailButton, fourtyTwoButton, emptyButton, leftArrowButton, rightArrowButton])
seventhRow.distribution = .fillEqually
seventhRow.spacing = 1

let buttonStackView = UIStackView(arrangedSubviews: [seventhRow, sixthRow, fifthRow, fourthRow, thirdRow, secondRow, firstRow])
buttonStackView.axis = .vertical
buttonStackView.distribution = .fillEqually
buttonStackView.spacing = 1

let hostStackView = UIStackView(arrangedSubviews: [textView, label, buttonStackView])
hostStackView.frame = hostView.bounds
hostStackView.axis = .vertical
//  hostStackView.distribution = .FillEqually
hostStackView.spacing = 1

textView.heightAnchor.constraint(equalToConstant: 80).isActive = true
label.heightAnchor.constraint(equalToConstant: 20).isActive = true

hostView.addSubview(hostStackView)

hostView

//: [Next](@next)
