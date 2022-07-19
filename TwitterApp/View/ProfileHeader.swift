//
//  ProfileHeader.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 27/04/22.
//

import UIKit



import UIKit

class ProfileHeader: UICollectionReusableView {

  // MARK: - Properties

  private let filterBar = ProfileFilterView()

  private lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .twitterBlue
    view.addSubview(backButton)
    backButton.anchor(top: view.topAnchor, left: view.leftAnchor,
                      paddingTop: 42, paddingLeft: 16)
    backButton.setDimensions(width: 30, height: 30)

    return view
  }()

  private lazy var backButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_white_24dp").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
    return button
    
  }()

  private let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    iv.layer.borderColor = UIColor.white.cgColor
    iv.layer.borderWidth = 4
    return iv
  }()

  private lazy var editProfileFollowButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Follow", for: .normal)
    button.layer.borderColor = UIColor.twitterBlue.cgColor
    button.layer.borderWidth = 1.25
    button.setTitleColor(.twitterBlue, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.addTarget(self, action: #selector(handleEditProfileFollow), for: .touchUpInside)
    return button
  }()

  private let fullnameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20)
    label.text = "Cintia Schirmann"
    return label
  }()

  private let usernameLabel: UILabel = {
    let label = UILabel()
    label.text = "@ruivao"
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .lightGray
    return label
  }()

  private let bioLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.numberOfLines = 3
    label.text = "This is a user bio that will span more than one line for test purposes"
    return label
  }()



  // MARK: - Lifecycle

  override init(frame: CGRect){
    super.init(frame: frame)

    addSubview(containerView)
    containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 108)

    addSubview(profileImageView)
    profileImageView.anchor(top: containerView.bottomAnchor, left: leftAnchor, paddingTop: -24, paddingLeft: 8)

    profileImageView.setDimensions(width: 80, height: 80)
    profileImageView.layer.cornerRadius = 80 / 2

    addSubview(editProfileFollowButton)
    editProfileFollowButton.anchor(top: containerView.bottomAnchor, right: rightAnchor, paddingTop: 12, paddingRight: 12)
    editProfileFollowButton.setDimensions(width: 100, height: 35)
    editProfileFollowButton.layer.cornerRadius = 35 / 2

    let stack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel, bioLabel])
    stack.axis = .vertical
    stack.distribution = .fillProportionally
    stack.spacing = 4

    addSubview(stack)
    stack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)

    addSubview(filterBar)
    filterBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - API

  // MARK: - Selectors

  @objc func handleDismissal(){
//    navigationController?.popViewController(animated: true) 
  }

  @objc func handleEditProfileFollow(){
    print("DEBUG: Following...")
  }

  // MARK: - Helpers

}
