//
//  FeedController.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 27/02/22.
//

import UIKit

class ExploreController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .white
    navigationItem.title = "Explore"
  }
}
