//: [Previous](@previous)

import UIKit
import XCPlayground

//guard #available(iOS 9, *) else { fatalError() }

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 400))
hostView.backgroundColor = UIColor.lightGrayColor()
XCPShowView("hostView", view: hostView)

func makeButtonWithTitle(title: String, selector: String, tag: Int) -> UIButton {
  let button = UIButton(type: .System)
  button.backgroundColor = tag < 10 ? UIColor(white: 0.95, alpha: 1.0) : UIColor.whiteColor()
  button.setTitle(title, forState: .Normal)
  button.titleLabel?.font = UIFont.boldSystemFontOfSize(16)
  button.tag = tag
  return button
}

let makeView = { (color: UIColor) -> UIView in
  let view = UIView(frame: CGRect.zeroRect)
  view.translatesAutoresizingMaskIntoConstraints = false
  view.backgroundColor = color
  return view
}

let piButton    = makeButtonWithTitle("pi", selector: "", tag: 100)
let eeButton    = makeButtonWithTitle("ee", selector: "", tag: 100)
let zeroButton  = makeButtonWithTitle("0", selector: "", tag: 0)
let dotButton   = makeButtonWithTitle(".", selector: "", tag: 100)
let equalButton = makeButtonWithTitle("=", selector: "", tag: 100)
let powerButton = makeButtonWithTitle("^", selector: "", tag: 100)
let sqrtButton  = makeButtonWithTitle("√", selector: "", tag: 100)
let oneButton   = makeButtonWithTitle("1", selector: "", tag: 1)
let twoButton   = makeButtonWithTitle("2", selector: "", tag: 2)
let threeButton = makeButtonWithTitle("3", selector: "", tag: 3)
let plusButton  = makeButtonWithTitle("+", selector: "", tag: 100)
let log2Button  = makeButtonWithTitle("log2", selector: "", tag: 100)
let log10Button = makeButtonWithTitle("log10", selector: "", tag: 100)
let fourButton  = makeButtonWithTitle("4", selector: "", tag: 4)
let fiveButton  = makeButtonWithTitle("5", selector: "", tag: 5)
let sixButton   = makeButtonWithTitle("6", selector: "", tag: 6)
let minusButton = makeButtonWithTitle("−", selector: "", tag: 100)
let expButton   = makeButtonWithTitle("exp", selector: "", tag: 100)
let lnButton    = makeButtonWithTitle("ln", selector: "", tag: 100)
let sevenButton = makeButtonWithTitle("7", selector: "", tag: 7)
let eighyButton = makeButtonWithTitle("8", selector: "", tag: 8)
let nineButton  = makeButtonWithTitle("9", selector: "", tag: 9)
let timesButton = makeButtonWithTitle("×", selector: "", tag: 100)
let sinButton   = makeButtonWithTitle("sin", selector: "", tag: 100)
let cosButton   = makeButtonWithTitle("cos", selector: "", tag: 100)
let tanButton   = makeButtonWithTitle("tan", selector: "", tag: 100)
let openParenthesesButton = makeButtonWithTitle("(", selector: "", tag: 100)
let closeParenthesesButton = makeButtonWithTitle(")", selector: "", tag: 100)
let divideButton = makeButtonWithTitle("÷", selector: "", tag: 100)
let secondButton = makeButtonWithTitle("2nd", selector: "", tag: 100)
let constButton = makeButtonWithTitle("const", selector: "", tag: 100)
let degButton   = makeButtonWithTitle("deg", selector: "", tag: 100)
let histButton  = makeButtonWithTitle("hist", selector: "", tag: 100)
let ansButton   = makeButtonWithTitle("ans", selector: "", tag: 100)
let delButton   = makeButtonWithTitle("del", selector: "", tag: 100)
let helpButton = makeButtonWithTitle("help", selector: "", tag: 100)
let mailButton = makeButtonWithTitle("mail", selector: "", tag: 100)
let fourtyTwoButton   = makeButtonWithTitle("42", selector: "", tag: 100)
let emptyButton  = makeButtonWithTitle("", selector: "", tag: 100)
let leftArrowButton   = makeButtonWithTitle("←", selector: "", tag: 100)
let rightArrowButton   = makeButtonWithTitle("→", selector: "", tag: 100)

let textView = UITextView(frame: CGRect.zeroRect)
textView.translatesAutoresizingMaskIntoConstraints = false
textView.text = "1+2+3×(4-5)+sin(0.6)\n= 0.564642473395035"
textView.font = UIFont(name: "Menlo-Bold", size: 14)

let label = UILabel(frame: CGRect.zeroRect)
label.translatesAutoresizingMaskIntoConstraints = false
label.text = " = 0.564642473395035"
label.font = UIFont(name: "Menlo-Bold", size: 14)
label.backgroundColor = UIColor(white: 0.98, alpha: 1.0)

//let redView = makeView(.redColor())
//let blueView = makeView(.blueColor())
//let greenView = makeView(.greenColor())

if #available(iOS 9, *) {
  let firstRow = UIStackView(arrangedSubviews: [piButton, eeButton, zeroButton, dotButton, equalButton])
  firstRow.distribution = .FillProportionally
  firstRow.spacing = 1
  
  zeroButton.widthAnchor.constraintEqualToAnchor(piButton.widthAnchor, multiplier: 2.0, constant: 1.0).active = true
  piButton.widthAnchor.constraintEqualToAnchor(eeButton.widthAnchor).active = true
  piButton.widthAnchor.constraintEqualToAnchor(dotButton.widthAnchor).active = true
  piButton.widthAnchor.constraintEqualToAnchor(equalButton.widthAnchor).active = true
  
  let secondRow = UIStackView(arrangedSubviews: [powerButton, sqrtButton, oneButton, twoButton, threeButton, plusButton])
  secondRow.distribution = .FillEqually
  secondRow.spacing = 1
  
  
  let thirdRow = UIStackView(arrangedSubviews: [log2Button, log10Button, fourButton, fiveButton, sixButton, minusButton])
  thirdRow.distribution = .FillEqually
  thirdRow.spacing = 1
  
  let fourthRow = UIStackView(arrangedSubviews: [expButton, lnButton, sevenButton, eighyButton, nineButton, timesButton])
  fourthRow.distribution = .FillEqually
  fourthRow.spacing = 1
  
  let fifthRow = UIStackView(arrangedSubviews: [sinButton, cosButton, tanButton, openParenthesesButton, closeParenthesesButton, divideButton])
  fifthRow.distribution = .FillEqually
  fifthRow.spacing = 1
  
  let sixthRow = UIStackView(arrangedSubviews: [secondButton, constButton, degButton, histButton, ansButton, delButton])
  sixthRow.distribution = .FillEqually
  sixthRow.spacing = 1
  
  let seventhRow = UIStackView(arrangedSubviews: [helpButton, mailButton, fourtyTwoButton, emptyButton, leftArrowButton, rightArrowButton])
  seventhRow.distribution = .FillEqually
  seventhRow.spacing = 1
  
  let buttonStackView = UIStackView(arrangedSubviews: [seventhRow, sixthRow, fifthRow, fourthRow, thirdRow, secondRow, firstRow])
  buttonStackView.axis = .Vertical
  buttonStackView.distribution = .FillEqually
  buttonStackView.spacing = 1
  
  let hostStackView = UIStackView(arrangedSubviews: [textView, label, buttonStackView])
  hostStackView.frame = hostView.bounds
  hostStackView.axis = .Vertical
  //  hostStackView.distribution = .FillEqually
  hostStackView.spacing = 1
  
  textView.heightAnchor.constraintEqualToConstant(80).active = true
  label.heightAnchor.constraintEqualToConstant(20).active = true
  
  hostView.addSubview(hostStackView)
  
  hostView
}

//: [Next](@next)
