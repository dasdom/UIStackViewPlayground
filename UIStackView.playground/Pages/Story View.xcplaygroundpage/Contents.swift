//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
hostView.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = hostView

let headerLabel = UILabel()
headerLabel.translatesAutoresizingMaskIntoConstraints = false
headerLabel.numberOfLines = 0
headerLabel.text = "This is an info text shown on top of the image. The info text should inform the reader about the topic."

let topStackView = UIStackView(arrangedSubviews: [headerLabel])

let image = UIImage(named: "header.jpg")
let imageView = UIImageView(image: image)
imageView.backgroundColor = UIColor.yellow
imageView.contentMode = .scaleAspectFit

let bottomLabel = UILabel()
bottomLabel.translatesAutoresizingMaskIntoConstraints = false
bottomLabel.numberOfLines = 0
bottomLabel.text = "This is the story text. It is interessting and shows a lot insight to the topic. The reader should be eager to read it and at the end he/she would be able to share with friends and family."

let bottomStackView = UIStackView(arrangedSubviews: [bottomLabel])

let stackView = UIStackView(arrangedSubviews: [topStackView, imageView, bottomStackView])
stackView.translatesAutoresizingMaskIntoConstraints = false
stackView.axis = .vertical
stackView.spacing = 10

hostView.addSubview(stackView)

let views = ["stackView": stackView]
var layoutConstraints: [NSLayoutConstraint] = []
layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|[stackView]|", options: [], metrics: nil, views: views)
layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]", options: [], metrics: nil, views: views)
layoutConstraints.append(headerLabel.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor, constant: 10))
layoutConstraints.append(headerLabel.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor, constant: 10))

let imageSize = image!.size
let imageHeight = hostView.frame.size.width * imageSize.height / imageSize.width
layoutConstraints.append(imageView.heightAnchor.constraint(equalToConstant: imageHeight))

layoutConstraints.append(bottomLabel.leadingAnchor.constraint(equalTo: bottomStackView.leadingAnchor, constant: 10))
layoutConstraints.append(bottomLabel.trailingAnchor.constraint(equalTo: bottomStackView.trailingAnchor, constant: 10))

NSLayoutConstraint.activate(layoutConstraints)

//: [Next](@next)
