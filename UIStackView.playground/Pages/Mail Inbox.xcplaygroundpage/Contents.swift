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
    
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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
        unreadIndicatorView.backgroundColor = UIColor(red: 0.3, green: 0.4, blue: 0.9, alpha: 1.0)
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
    
    NSLayoutConstraint.activate(
      [
      mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
      unreadIndicatorHostView.widthAnchor.constraint(equalTo: senderLabel.heightAnchor),
      unreadIndicatorHostView.heightAnchor.constraint(equalTo: senderLabel.heightAnchor),
      unreadIndicatorView.widthAnchor.constraint(equalToConstant: 10),
      disclosureIndicatorImageView.heightAnchor.constraint(equalToConstant: 10),
      unreadIndicatorView.heightAnchor.constraint(equalToConstant: 10),
      unreadIndicatorView.centerXAnchor.constraint(equalTo: unreadIndicatorHostView.centerXAnchor),
      unreadIndicatorView.centerYAnchor.constraint(equalTo: unreadIndicatorHostView.centerYAnchor),
      ])
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
