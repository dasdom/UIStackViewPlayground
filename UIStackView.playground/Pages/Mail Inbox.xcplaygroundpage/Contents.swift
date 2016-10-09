//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class TableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MessageCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageCell
        
        cell.senderLabel.text = "Hans Wurst"
        cell.subjectLabel.text = "Check out my new wurst"
        cell.previewLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod risus non sem ornare, non tempor mi pellentesque."
        cell.dateLabel.text = "09:15"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
        senderLabel = UILabel(frame: .zero)
        //      senderLabel.backgroundColor = UIColor.yellowColor()
        senderLabel.font = .boldSystemFont(ofSize: 13)
        
        dateLabel = UILabel(frame: .zero)
        //      dateLabel.backgroundColor = UIColor.brownColor()
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = UIColor.gray
        
        let disclosureIndicatorImageView = UIImageView(image: UIImage(named: "disclosureIndicator"))
        disclosureIndicatorImageView.clipsToBounds = true
        //      disclosureIndicatorImageView.backgroundColor = UIColor.yellowColor()
        
        subjectLabel = UILabel(frame: .zero)
        //      subjectLabel.backgroundColor = UIColor.redColor()
        subjectLabel.font = .systemFont(ofSize: 12)
        
        previewLabel = UILabel(frame: .zero)
        //      previewLabel.backgroundColor = UIColor.greenColor()
        previewLabel.font = .systemFont(ofSize: 12)
        previewLabel.textColor = UIColor.gray
        previewLabel.numberOfLines = 2
        
        unreadIndicatorView = UIView(frame: .zero)
        unreadIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        unreadIndicatorView.backgroundColor = UIColor.blue
        unreadIndicatorView.layer.cornerRadius = 5
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let senderAndDateStackView = UIStackView(arrangedSubviews: [senderLabel, dateLabel, disclosureIndicatorImageView])
        senderAndDateStackView.alignment = .center
        senderAndDateStackView.spacing = 5
        
        let textStackView = UIStackView(arrangedSubviews: [senderAndDateStackView, subjectLabel, previewLabel])
        textStackView.axis = .vertical
        //      textStackView.spacing = 2
        
        let unreadIndicatorHostView = UIView(frame: .zero)
        unreadIndicatorHostView.addSubview(unreadIndicatorView)
        //      unreadIndicatorHostView.backgroundColor = UIColor.yellowColor()
        
        let mainStackView = UIStackView(arrangedSubviews: [unreadIndicatorHostView, textStackView])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.alignment = .top
        mainStackView.spacing = 5
        contentView.addSubview(mainStackView)
        
        let views = ["mainStackView": mainStackView]
        var constraints = [NSLayoutConstraint]()
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-5-[mainStackView]-10-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[mainStackView]-5-|", options: [], metrics: nil, views: views)
        constraints.append(unreadIndicatorHostView.widthAnchor.constraint(equalTo: senderLabel.heightAnchor))
        constraints.append(unreadIndicatorHostView.heightAnchor.constraint(equalTo: senderLabel.heightAnchor))
        constraints.append(unreadIndicatorView.widthAnchor.constraint(equalToConstant: 10))
        constraints.append(disclosureIndicatorImageView.heightAnchor.constraint(equalToConstant: 10))
        
        constraints.append(unreadIndicatorView.heightAnchor.constraint(equalToConstant: 10))
        constraints.append(unreadIndicatorView.centerXAnchor.constraint(equalTo: unreadIndicatorHostView.centerXAnchor))
        constraints.append(unreadIndicatorView.centerYAnchor.constraint(equalTo: unreadIndicatorHostView.centerYAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let viewController = TableViewController()

let navigationController = UINavigationController(rootViewController: viewController)
navigationController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

PlaygroundPage.current.liveView = navigationController.view

//: [Next](@next)
