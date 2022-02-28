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
  }
}


