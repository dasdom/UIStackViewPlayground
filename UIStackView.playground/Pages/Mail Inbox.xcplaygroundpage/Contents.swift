//: [Previous](@previous)

import UIKit
import XCPlayground

if #available(iOS 9, *) {
  class TableViewController : UITableViewController {
    
    override func viewDidLoad() {
      super.viewDidLoad()
      tableView.registerClass(MessageCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MessageCell
      
      cell.senderLabel.text = "Hans Wurst"
      cell.subjectLabel.text = "Check out my new wurst"
      cell.previewLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod risus non sem ornare, non tempor mi pellentesque."
      cell.dateLabel.text = "09:15"
      
      return cell
    }
    
    private override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return 70;
    }
  }
  
  class MessageCell : UITableViewCell {
    let senderLabel: UILabel
    let dateLabel: UILabel
    let subjectLabel: UILabel
    let previewLabel: UILabel
    let unreadIndicatorView: UIView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      senderLabel = UILabel(frame: CGRect.zeroRect)
//      senderLabel.backgroundColor = UIColor.yellowColor()
      senderLabel.font = UIFont.boldSystemFontOfSize(13)
      
      dateLabel = UILabel(frame: CGRect.zeroRect)
//      dateLabel.backgroundColor = UIColor.brownColor()
      dateLabel.font = UIFont.systemFontOfSize(12)
      dateLabel.textColor = UIColor.grayColor()
      
      let disclosureIndicatorImageView = UIImageView(image: UIImage(named: "disclosureIndicator"))
      disclosureIndicatorImageView.clipsToBounds = true
//      disclosureIndicatorImageView.backgroundColor = UIColor.yellowColor()
      
      subjectLabel = UILabel(frame: CGRect.zeroRect)
//      subjectLabel.backgroundColor = UIColor.redColor()
      subjectLabel.font = UIFont.systemFontOfSize(12)
      
      previewLabel = UILabel(frame: CGRect.zeroRect)
//      previewLabel.backgroundColor = UIColor.greenColor()
      previewLabel.font = UIFont.systemFontOfSize(12)
      previewLabel.textColor = UIColor.grayColor()
      previewLabel.numberOfLines = 2
      
      unreadIndicatorView = UIView(frame: CGRect.zeroRect)
      unreadIndicatorView.translatesAutoresizingMaskIntoConstraints = false
      unreadIndicatorView.backgroundColor = UIColor.blueColor()
      unreadIndicatorView.layer.cornerRadius = 5
      
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      let senderAndDateStackView = UIStackView(arrangedSubviews: [senderLabel, dateLabel, disclosureIndicatorImageView])
      senderAndDateStackView.alignment = .Center
      senderAndDateStackView.spacing = 5
      
      let textStackView = UIStackView(arrangedSubviews: [senderAndDateStackView, subjectLabel, previewLabel])
      textStackView.axis = .Vertical
      //      textStackView.spacing = 2
      
      let unreadIndicatorHostView = UIView(frame: CGRect.zeroRect)
      unreadIndicatorHostView.addSubview(unreadIndicatorView)
      //      unreadIndicatorHostView.backgroundColor = UIColor.yellowColor()
      
      let mainStackView = UIStackView(arrangedSubviews: [unreadIndicatorHostView, textStackView])
      mainStackView.translatesAutoresizingMaskIntoConstraints = false
      mainStackView.alignment = .Top
      mainStackView.spacing = 5
      contentView.addSubview(mainStackView)
      
      let views = ["mainStackView": mainStackView]
      var constraints = [NSLayoutConstraint]()
      constraints += NSLayoutConstraint.constraintsWithVisualFormat("|-5-[mainStackView]-10-|", options: [], metrics: nil, views: views)
      constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[mainStackView]-5-|", options: [], metrics: nil, views: views)
      constraints.append(unreadIndicatorHostView.widthAnchor.constraintEqualToAnchor(senderLabel.heightAnchor))
      constraints.append(unreadIndicatorHostView.heightAnchor.constraintEqualToAnchor(senderLabel.heightAnchor))
      constraints.append(unreadIndicatorView.widthAnchor.constraintEqualToConstant(10))
      constraints.append(disclosureIndicatorImageView.heightAnchor.constraintEqualToConstant(10))
      
      constraints.append(unreadIndicatorView.heightAnchor.constraintEqualToConstant(10))
      constraints.append(unreadIndicatorView.centerXAnchor.constraintEqualToAnchor(unreadIndicatorHostView.centerXAnchor))
      constraints.append(unreadIndicatorView.centerYAnchor.constraintEqualToAnchor(unreadIndicatorHostView.centerYAnchor))
      
      NSLayoutConstraint.activateConstraints(constraints)
    }
    
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }

  let viewController = TableViewController()
  
    let navigationController = UINavigationController(rootViewController: viewController)
  navigationController.view.frame = CGRectMake(0, 0, 320, 480)
  
  XCPShowView("Table View", view: viewController.view)
}
//: [Next](@next)
