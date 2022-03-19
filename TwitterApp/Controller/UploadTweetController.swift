//
//  UploadTweetController.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 18/03/22.
//

import UIKit

class UploadTweetController: UIViewController {
  
  
  // MARK: - Properties
  
  private let user: User
  
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
  
  private let profilelImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.setDimensions(width: 48, height: 48)
    iv.layer.cornerRadius = 48 / 2
    iv.backgroundColor = .twitterBlue
    return iv
  }()
  
  
  // MARK: - Lifecycle
  
  init(user: User){
    self.user = user
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
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
    configureNavigationBar()
    
    view.addSubview(profilelImageView)
    profilelImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)
    
    profilelImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
    
  }
  
  func configureNavigationBar(){
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.isTranslucent = true
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
  }
}

