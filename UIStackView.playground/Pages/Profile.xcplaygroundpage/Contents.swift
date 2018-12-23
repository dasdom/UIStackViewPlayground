//: [Previous](@previous)

//: # Profile

import UIKit
import PlaygroundSupport

//: Constants
let socialButtonHeight: CGFloat = 30
let socialButtonSpacing: CGFloat = 10
let avatarImageHeight: CGFloat = 100

// Helper function to create the small social buttons on the header image.
func socialButtonWith(white: CGFloat) -> UIButton {
    let button = UIButton(type: .custom)
    button.backgroundColor = UIColor(white: white, alpha: 1.0)
    button.layer.cornerRadius = ceil(socialButtonHeight/2)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    return button
}

//: First we need a `hostView` to put the different elements on.
let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
hostView.backgroundColor = .lightGray
PlaygroundPage.current.liveView = hostView

/*:
Those elements are:

- a header image
*/
let headerImageView = UIImageView(frame: .zero)
headerImageView.backgroundColor = UIColor.yellow
headerImageView.contentMode = .scaleAspectFill

//: - different social button (App.net, Twitter, StackOverflow, Github)
let adnButton = socialButtonWith(white: 0.2)
adnButton.setTitle("A", for: UIControl.State.normal)

let twitterButton = socialButtonWith(white: 0.3)
twitterButton.setTitle("t", for: UIControl.State.normal)

let stackOverflowButton = socialButtonWith(white: 0.4)
stackOverflowButton.setTitle("S", for: UIControl.State.normal)

let githubButton = socialButtonWith(white: 0.5)
githubButton.setTitle("g", for: UIControl.State.normal)

//: - avatar image
let avatarImageView = UIImageView(frame: .zero)
avatarImageView.backgroundColor = UIColor(white: 0.6, alpha: 1.0)
avatarImageView.layer.cornerRadius = ceil(avatarImageHeight/2)
avatarImageView.layer.borderColor = UIColor.gray.cgColor
avatarImageView.layer.borderWidth = 2
avatarImageView.clipsToBounds = true
avatarImageView.contentMode = .scaleAspectFit

//: - the name
let nameLabel = UILabel(frame: .zero)
nameLabel.text = "Dominik Hauser"
nameLabel.font = UIFont(name: "Avenir-Medium", size: 25)
nameLabel.textColor = UIColor.white

//: - the handle
let handleLabel = UILabel(frame: .zero)
handleLabel.text = "dasdom"
handleLabel.font = UIFont(name: "Avenir-Book", size: 18)
handleLabel.textColor = UIColor.lightGray

//: - a short bio of the user
let bioLabel = UILabel(frame: .zero)
bioLabel.text = "iOS dev durung the day. iOS dev at night. Father and husband all time. Auto Layout master. Swift lover"
bioLabel.numberOfLines = 0
bioLabel.font = UIFont(name: "Avenir-Oblique", size: 13)
bioLabel.textAlignment = .center
bioLabel.textColor = UIColor.lightGray

// dark background color
hostView.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.14, alpha: 1.0)

/*:
## Building the user interface

The user interface is build using four `UIStackView`s.

- a vertical stack view for the round social buttons on top of the header image
*/
let socialButtonStackView = UIStackView(arrangedSubviews: [adnButton, twitterButton, stackOverflowButton, githubButton])
socialButtonStackView.axis = .vertical
socialButtonStackView.spacing = socialButtonSpacing
socialButtonStackView.distribution = .fillEqually
socialButtonStackView.alignment = .center

//: - a horizontal stack view for the header view and the social button stack view (note: the spacing is negative)
let headerStackView = UIStackView(arrangedSubviews: [headerImageView, socialButtonStackView])
headerStackView.spacing = -(socialButtonHeight+socialButtonSpacing*2)
headerStackView.alignment = .center

let personInfoStackView = UIStackView(arrangedSubviews: [avatarImageView, nameLabel, handleLabel, bioLabel])
personInfoStackView.axis = .vertical
personInfoStackView.alignment = .center
personInfoStackView.spacing = 10

let mainStackView = UIStackView(arrangedSubviews: [headerStackView, personInfoStackView])
mainStackView.translatesAutoresizingMaskIntoConstraints = false
mainStackView.axis = .vertical
mainStackView.alignment = .center
mainStackView.spacing = -ceil(avatarImageHeight/2)

hostView.addSubview(mainStackView)

// MARK: - Layout
headerImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
socialButtonStackView.widthAnchor.constraint(equalToConstant: socialButtonHeight+socialButtonSpacing*2).isActive = true

let numberOfSocialButtons = CGFloat(socialButtonStackView.arrangedSubviews.count)
let socialButtonStackViewHeight = numberOfSocialButtons * socialButtonHeight + (numberOfSocialButtons - 1) * socialButtonSpacing
socialButtonStackView.heightAnchor.constraint(equalToConstant: socialButtonStackViewHeight).isActive = true

avatarImageView.widthAnchor.constraint(equalToConstant: avatarImageHeight).isActive = true
avatarImageView.heightAnchor.constraint(equalToConstant: avatarImageHeight).isActive = true

NSLayoutConstraint.activate(
  [
    mainStackView.leadingAnchor.constraint(equalTo: hostView.leadingAnchor),
    mainStackView.trailingAnchor.constraint(equalTo: hostView.trailingAnchor),
    mainStackView.topAnchor.constraint(equalTo: hostView.topAnchor),
    bioLabel.leadingAnchor.constraint(equalTo: personInfoStackView.leadingAnchor, constant:10),
    ])

headerImageView.image = UIImage(named: "DSC_1165.jpg")
avatarImageView.image = UIImage(named: "IMG_0345.jpg")

hostView

//: [Next](@next)
