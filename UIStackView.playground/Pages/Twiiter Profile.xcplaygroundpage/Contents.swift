//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let avatarImageHeight: CGFloat = 100

//: First we need a `hostView` to put the different elements on.
let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
hostView.backgroundColor = UIColor.lightGray
//XCPShowView("hostView", view: hostView)

class TwitterProfileViewController : UIViewController {
    
    var profileView: TwitterProfileView { return view as! TwitterProfileView }
    
    override func loadView() {
        let contentView = TwitterProfileView()
        
        view = contentView
    }
    
    override func viewDidLoad() {
        title = "Profile"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        profileView.headerImage = UIImage(named: "header.jpg")
        profileView.avatarImageView.image = UIImage(named: "avatar.jpg")
    }
}

class TwitterProfileView : UIView {
    
    fileprivate let headerImageView: UIImageView
    let avatarImageView: UIImageView
    
    var headerImage: UIImage? {
        didSet {
            if let image = headerImage {
                let imageSize = image.size
                headerImageViewHeightConstraint.constant = frame.size.width * imageSize.height / imageSize.width
                headerImageView.image = headerImage
            }
        }
    }
    
    fileprivate let headerImageViewHeightConstraint: NSLayoutConstraint
    
    override init(frame: CGRect) {
        headerImageView = UIImageView()
        headerImageView.contentMode = .scaleAspectFit
        
        avatarImageView = UIImageView()
        avatarImageView.contentMode = .scaleAspectFit

        let headerStackView = UIStackView(arrangedSubviews: [headerImageView])
        
        let avatarAndTextStackView = UIStackView(arrangedSubviews: [avatarImageView])
        
        let stackView = UIStackView(arrangedSubviews: [headerStackView, avatarAndTextStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        headerImageViewHeightConstraint = NSLayoutConstraint(item: headerImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0)

        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.14, alpha: 1.0)
        
        addSubview(stackView)
        
        let views = ["stack": stackView]
        var layoutConstraints = [NSLayoutConstraint]()
        
        layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|[stack]|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[stack]", options: [], metrics: nil, views: views)
        layoutConstraints.append(headerImageViewHeightConstraint)
//        layoutConstraints.append(avatarImageView.widthAnchor.constraintEqualToConstant(avatarImageHeight))
        layoutConstraints.append(avatarImageView.heightAnchor.constraint(equalToConstant: avatarImageHeight))
        
        
        NSLayoutConstraint.activate(layoutConstraints)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let profileViewController = TwitterProfileViewController()

let navigationController = UINavigationController(rootViewController: profileViewController)
navigationController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

PlaygroundPage.current.liveView = navigationController.view


//: [Next](@next)
