//
//  User.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 06/03/22.
//

import Firebase

struct User {
  let fullname: String
  let email: String
  let username: String
  let profileImageUrl: String
  let uid: String
  
  init(uid: String, dictionary: [String: AnyObject]){
    self.uid = uid
    
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.email = dictionary["email"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
    self.profileImageUrl = dictionary["profildeImageUrl"] as? String ?? ""
  }
}
