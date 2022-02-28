//
//  FeedController.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 27/02/22.
//

import UIKit

class NotificationsController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .white
    navigationItem.title = "Notifications"
  }
}
