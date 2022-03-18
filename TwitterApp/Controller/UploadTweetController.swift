//
//  UploadTweetController.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 18/03/22.
//

import UIKit

class UploadTweetController: UIViewController {
  
  
  // MARK: - Properties
  
  private lazy var actionButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .twitterBlue
    button.setTitle("Tweet", for: .normal)
    button.titleLabel?.textAlignment = .center
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    button.setTitleColor(.white, for: .normal)
    
    button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
    button.layer.cornerRadius = 32 / 2
    
    button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)
    
    return button
  }()
  
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  
  // MARK: - Selectors
  
  @objc func handleCancel(){
    dismiss(animated: true, completion: nil)
  }
  
  @objc func handleUploadTweet(){
    print("DEBUG: new Tweet")
  }
  
  
  // MARK: - API
  
  
  // MARK: - Helpers
  
  func configureUI(){
    view.backgroundColor = .white
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.isTranslucent = true
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
  }
}

