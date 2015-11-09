//: [Previous](@previous)

import UIKit
import XCPlayground

class TwitterTableViewController: UITableViewController {
  
  let tweets = [["handle": "@dasdom", "date": "2 m", "tweet": "UIStackViews are so awesome! Looking forward to rewrite all UI code. Presumable some time next year.", "quotehandle": "@tim_cook", "quote": "Check out my UIStackView tutorial. It's awesome!"]
    ,["handle": "@dasdom", "date": "3 m", "tweet": "This is a tweet without a quote to show that this works as well."]
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.registerClass(TweetCodeCell.self, forCellReuseIdentifier: "TweetCell")

    tableView.estimatedRowHeight = 80
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return tweets.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCodeCell
    
    let tweet = tweets[indexPath.row]
    cell.handleLabel.text = tweet["handle"]
    cell.dateLabel.text = tweet["date"]
    cell.tweetLabel.text = tweet["tweet"]
    cell.quote = (tweet["quotehandle"], tweet["quote"])
    cell.avatarImageView.image = UIImage(named: "avatar.jpg")
    
    return cell
  }
  
}

class TweetCodeCell: UITableViewCell {
  
  let avatarImageView: UIImageView
  let handleLabel: UILabel
  let dateLabel: UILabel
  let tweetLabel: UILabel
  
  private let quoteHandle: UILabel
  private let quoteLabel: UILabel
  private let quoteStackView: UIStackView
  private let quoteHostStackView: UIStackView
  
  private var quotePaddingConstraints = [NSLayoutConstraint]()
  
  var quote: (handle: String?, quoteString: String?) {
    didSet {
      quoteHandle.text = quote.handle
      quoteLabel.text = quote.quoteString
      if let _ = quote.handle, _ = quote.quoteString {
        quoteStackView.hidden = false
        quoteStackView.spacing = 2
        quoteHostStackView.hidden = false
        NSLayoutConstraint.activateConstraints(quotePaddingConstraints)
      } else {
        quoteStackView.hidden = true
        quoteStackView.spacing = 0
        quoteHostStackView.hidden = true
        NSLayoutConstraint.deactivateConstraints(quotePaddingConstraints)
      }
    }
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
    avatarImageView = UIImageView()
    avatarImageView.backgroundColor = .brownColor()
    avatarImageView.contentMode = .ScaleAspectFill
    avatarImageView.layer.cornerRadius = 5
    avatarImageView.clipsToBounds = true
    
    handleLabel = UILabel()
    handleLabel.font = UIFont.boldSystemFontOfSize(14)
    
    dateLabel = UILabel()
    dateLabel.font = UIFont.boldSystemFontOfSize(14)
    dateLabel.textColor = .grayColor()
    
    let handleDateStackView = UIStackView(arrangedSubviews: [handleLabel, dateLabel])
    
    tweetLabel = UILabel()
    tweetLabel.numberOfLines = 0
    
    quoteHandle = UILabel()
    quoteHandle.font = UIFont.boldSystemFontOfSize(13)
    
    quoteLabel = UILabel()
    quoteLabel.numberOfLines = 0
    quoteLabel.font = UIFont.systemFontOfSize(13)
    
    quoteStackView = UIStackView(arrangedSubviews: [quoteHandle, quoteLabel])
    quoteStackView.axis = .Vertical
    quoteStackView.alignment = .Center
    //        quoteStackView.distribution = .EqualSpacing
    //        quoteStackView.spacing = 2
    
    quoteHostStackView = UIStackView(arrangedSubviews: [quoteStackView])
    quoteHostStackView.alignment = .Center
    
    let quoteStackViewBackgroundView = UIView()
    quoteStackViewBackgroundView.translatesAutoresizingMaskIntoConstraints = false
    quoteStackViewBackgroundView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    quoteStackViewBackgroundView.layer.cornerRadius = 5
    quoteStackViewBackgroundView.clipsToBounds = true
    
    let tweetStackView = UIStackView(arrangedSubviews: [tweetLabel, quoteHostStackView])
    tweetStackView.axis = .Vertical
    tweetStackView.spacing = 5
    
    let textStackView = UIStackView(arrangedSubviews: [handleDateStackView, tweetStackView])
    textStackView.axis = .Vertical
    textStackView.spacing = 3
    
    let stackView = UIStackView(arrangedSubviews: [avatarImageView, textStackView])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .Top
    stackView.spacing = 5
    
    quotePaddingConstraints.append(quoteStackView.topAnchor.constraintEqualToAnchor(quoteHostStackView.topAnchor, constant: 10))
    quotePaddingConstraints.append(quoteStackView.bottomAnchor.constraintEqualToAnchor(quoteHostStackView.bottomAnchor, constant: -10))
    
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .whiteColor()
    
    contentView.addSubview(stackView)
    quoteHostStackView.insertSubview(quoteStackViewBackgroundView, atIndex: 0)
    
    let views = ["stackView": stackView, "quoteBackground": quoteStackViewBackgroundView, "quoteLabel": quoteLabel, "quoteStackView": quoteStackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|-10-[stackView]-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[stackView]-(10@751)-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|[quoteBackground]|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[quoteBackground]|", options: [], metrics: nil, views: views)
    quotePaddingConstraints +=  NSLayoutConstraint.constraintsWithVisualFormat("|-10-[quoteLabel]-10-|", options: [], metrics: nil, views: views)
    layoutConstraints.append(avatarImageView.widthAnchor.constraintEqualToConstant(60))
    layoutConstraints.append(avatarImageView.heightAnchor.constraintEqualToConstant(60))
    layoutConstraints.append(quoteLabel.trailingAnchor.constraintEqualToAnchor(quoteHandle.trailingAnchor))
    layoutConstraints.append(quoteLabel.leadingAnchor.constraintEqualToAnchor(quoteHandle.leadingAnchor))
    layoutConstraints += quotePaddingConstraints
    NSLayoutConstraint.activateConstraints(layoutConstraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let tableViewController = TwitterTableViewController()
let view = tableViewController.view

view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

XCPlaygroundPage.currentPage.liveView = tableViewController.tableView

//: [Next](@next)
