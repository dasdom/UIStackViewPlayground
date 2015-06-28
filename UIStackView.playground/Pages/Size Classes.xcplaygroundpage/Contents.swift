//: [Previous](@previous)

import UIKit
import XCPlayground

if #available(iOS 9, *) {
  class ViewController : UIViewController {
    
    var contentView: View {
      return view as! View
    }
    
    private override func loadView() {
      view = View(frame: CGRect.zeroRect)
    }
    
    private override func viewDidLayoutSubviews() {
      contentView.stackView.axis = traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular ? UILayoutConstraintAxis.Horizontal : UILayoutConstraintAxis.Vertical
      print(traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular)
    }
  }
  
  class View: UIView {
    
    let stackView: UIStackView
    
    override init(frame: CGRect) {
      let makeView = { (color: UIColor) -> UIView in
        let view = UIView(frame: CGRect.zeroRect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
      }
      
      let redView = makeView(UIColor.redColor())
      let blueView = makeView(UIColor.blueColor())
      let yellowView = makeView(UIColor.yellowColor())
      
      stackView = UIStackView(arrangedSubviews: [redView, blueView, yellowView])
      stackView.translatesAutoresizingMaskIntoConstraints = false
      stackView.distribution = UIStackViewDistribution.FillEqually
      
      super.init(frame: frame)
      backgroundColor = UIColor.whiteColor()
 
      addSubview(stackView)
      
      stackView.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: 10).active = true
      stackView.trailingAnchor.constraintEqualToAnchor(trailingAnchor, constant: -10).active = true
      stackView.topAnchor.constraintEqualToAnchor(topAnchor, constant: 10).active = true
      stackView.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -10).active = true
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  }
  
  class HostViewController : UIViewController {
    
  }
  
  let regularViewController = ViewController()
  let regularView = regularViewController.view
  regularView.frame = CGRectMake(0, 0, 700, 100)
  
  let compactViewController = ViewController()
  let compactView = compactViewController.view
  compactView.frame = CGRectMake(300, 100, 100, 500)

  let showConpact = false
  if showConpact {
    XCPShowView("Compact", view: compactView)
  } else {
    XCPShowView("Regular", view: regularView)
  }
}


//: [Next](@next)
