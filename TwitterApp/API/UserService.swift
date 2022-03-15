//
//  UserService.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 06/03/22.
//
import Firebase

struct UserService {
  static let shared = UserService()
  
  func fetchUser() {
    guard let uid = Auth.auth().currentUser?.uid else { return}
    
    REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
      print("DEBUG: Snapshot is \(snapshot)")
      guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
       
      let user = User(uid: uid, dictionary: dictionary)
      
      print("DEBUG: Username is \(user.username)")
      print("DEBUG: Fullname is \(user.fullname)")
      
      
    }
  }
}
