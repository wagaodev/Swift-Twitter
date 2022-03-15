//
//  FeedController.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 27/02/22.
//

import UIKit

class FeedController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .white
    
    let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView
    
    let profileImageView = UIImageView()
    profileImageView.backgroundColor = .twitterBlue
    profileImageView.setDimensions(width: 32, height: 32)
    profileImageView.layer.cornerRadius = 32 / 2
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
  }
}


