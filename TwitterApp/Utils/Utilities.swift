//
//  Utilities.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 28/02/22.
//

import UIKit

class Utilities {
  func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
    let view = UIView()
    let imageView = UIImageView()
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    imageView.image = image
    view.addSubview(imageView)
    view.addSubview(textField)
    imageView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
    paddingLeft: 8, paddingBottom: 8)
    imageView.setDimensions(width: 24, height: 24)
    textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
    
    let dividerView = UIView()
    dividerView.backgroundColor = .white
    view.addSubview(dividerView)
    dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
    
    
    return view
  }
  
  func textField(withPlaceholder placeholder: String) -> UITextField {
    let tf = UITextField()
    tf.textColor = .white
    tf.font = UIFont.systemFont(ofSize: 16)
    tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    
    return tf
  }
}