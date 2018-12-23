//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class ViewController : UIViewController {
  
  var contentView: View {
    return view as! View
  }
  
  override func loadView() {
    view = View(frame: .zero)
  }
  
  override func viewDidLayoutSubviews() {
    let isRegularSizeClass = traitCollection.horizontalSizeClass == .regular
    contentView.stackView.axis = isRegularSizeClass ? .horizontal : .vertical
    print(isRegularSizeClass)
  }
}

class View: UIView {
  
  let stackView: UIStackView
  
  override init(frame: CGRect) {
    let makeView = { (color: UIColor) -> UIView in
      let view = UIView(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = color
      return view
    }
    
    let redView = makeView(UIColor.red)
    let blueView = makeView(UIColor.blue)
    let yellowView = makeView(UIColor.yellow)
    
    stackView = UIStackView(arrangedSubviews: [redView, blueView, yellowView])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.distribution = .fillEqually
    
    super.init(frame: frame)
    backgroundColor = UIColor.white
    
    addSubview(stackView)
    
    stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let regularViewController = ViewController()
let regularView = regularViewController.view
regularView?.frame = CGRect(x: 0, y: 0, width: 700, height: 100)

let compactViewController = ViewController()
let compactView = compactViewController.view
compactView?.frame = CGRect(x: 300, y: 100, width: 100, height: 500)

let showConpact = true
if showConpact {
  PlaygroundPage.current.liveView = compactView
} else {
  PlaygroundPage.current.liveView = regularView
}

//: [Next](@next)
