//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class TwitterTableViewController: UITableViewController {
  
  let tweets = [["handle": "@dasdom", "date": "2 m", "tweet": "UIStackViews are so awesome! Looking forward to rewrite all UI code. Presumable some time next year.", "quotehandle": "@tim_cook", "quote": "Check out my UIStackView tutorial. It's awesome!"]
    ,["handle": "@dasdom", "date": "3 m", "tweet": "This is a tweet without a quote to show that this works as well."]
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(TweetCodeCell.self, forCellReuseIdentifier: "TweetCell")

    tableView.estimatedRowHeight = 80
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return tweets.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCodeCell
    
    let tweet = tweets[(indexPath as NSIndexPath).row]
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
  
  fileprivate let quoteHandle: UILabel
  fileprivate let quoteLabel: UILabel
  fileprivate let quoteStackView: UIStackView
  fileprivate let quoteHostStackView: UIStackView
  
  fileprivate var quotePaddingConstraints = [NSLayoutConstraint]()
  
  var quote: (handle: String?, quoteString: String?) {
    didSet {
      quoteHandle.text = quote.handle
      quoteLabel.text = quote.quoteString
      if let _ = quote.handle, let _ = quote.quoteString {
        quoteStackView.isHidden = false
        quoteStackView.spacing = 2
        quoteHostStackView.isHidden = false
        NSLayoutConstraint.activate(quotePaddingConstraints)
      } else {
        quoteStackView.isHidden = true
        quoteStackView.spacing = 0
        quoteHostStackView.isHidden = true
        NSLayoutConstraint.deactivate(quotePaddingConstraints)
      }
    }
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
    avatarImageView = UIImageView()
    avatarImageView.backgroundColor = UIColor.brown
    avatarImageView.contentMode = .scaleAspectFill
    avatarImageView.layer.cornerRadius = 5
    avatarImageView.clipsToBounds = true
    
    handleLabel = UILabel()
    handleLabel.font = UIFont.boldSystemFont(ofSize: 14)
    
    dateLabel = UILabel()
    dateLabel.font = UIFont.boldSystemFont(ofSize: 14)
    dateLabel.textColor = UIColor.gray
    
    let handleDateStackView = UIStackView(arrangedSubviews: [handleLabel, dateLabel])
    
    tweetLabel = UILabel()
    tweetLabel.numberOfLines = 0
    
    quoteHandle = UILabel()
    quoteHandle.font = UIFont.boldSystemFont(ofSize: 13)
    
    quoteLabel = UILabel()
    quoteLabel.numberOfLines = 0
    quoteLabel.font = UIFont.systemFont(ofSize: 13)
    
    quoteStackView = UIStackView(arrangedSubviews: [quoteHandle, quoteLabel])
    quoteStackView.axis = .vertical
    quoteStackView.alignment = .center
    //        quoteStackView.distribution = .EqualSpacing
    //        quoteStackView.spacing = 2
    
    quoteHostStackView = UIStackView(arrangedSubviews: [quoteStackView])
    quoteHostStackView.alignment = .center
    
    let quoteStackViewBackgroundView = UIView()
    quoteStackViewBackgroundView.translatesAutoresizingMaskIntoConstraints = false
    quoteStackViewBackgroundView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    quoteStackViewBackgroundView.layer.cornerRadius = 5
    quoteStackViewBackgroundView.clipsToBounds = true
    
    let tweetStackView = UIStackView(arrangedSubviews: [tweetLabel, quoteHostStackView])
    tweetStackView.axis = .vertical
    tweetStackView.spacing = 5
    
    let textStackView = UIStackView(arrangedSubviews: [handleDateStackView, tweetStackView])
    textStackView.axis = .vertical
    textStackView.spacing = 3
    
    let stackView = UIStackView(arrangedSubviews: [avatarImageView, textStackView])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .top
    stackView.spacing = 5
    
    quotePaddingConstraints.append(quoteStackView.topAnchor.constraint(equalTo: quoteHostStackView.topAnchor, constant: 10))
    quotePaddingConstraints.append(quoteStackView.bottomAnchor.constraint(equalTo: quoteHostStackView.bottomAnchor, constant: -10))
    
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.white
    
    contentView.addSubview(stackView)
    quoteHostStackView.insertSubview(quoteStackViewBackgroundView, at: 0)
    
    let views = ["stackView": stackView, "quoteBackground": quoteStackViewBackgroundView, "quoteLabel": quoteLabel, "quoteStackView": quoteStackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|-10-[stackView]-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[stackView]-(10@751)-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|[quoteBackground]|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[quoteBackground]|", options: [], metrics: nil, views: views)
    quotePaddingConstraints +=  NSLayoutConstraint.constraints(withVisualFormat: "|-10-[quoteLabel]-10-|", options: [], metrics: nil, views: views)
    layoutConstraints.append(avatarImageView.widthAnchor.constraint(equalToConstant: 60))
    layoutConstraints.append(avatarImageView.heightAnchor.constraint(equalToConstant: 60))
    layoutConstraints.append(quoteLabel.trailingAnchor.constraint(equalTo: quoteHandle.trailingAnchor))
    layoutConstraints.append(quoteLabel.leadingAnchor.constraint(equalTo: quoteHandle.leadingAnchor))
    layoutConstraints += quotePaddingConstraints
    NSLayoutConstraint.activate(layoutConstraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let tableViewController = TwitterTableViewController()
let view = tableViewController.view

view?.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

PlaygroundPage.current.liveView = tableViewController.tableView

//: [Next](@next)
