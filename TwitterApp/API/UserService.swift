//
//  UserService.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 06/03/22.
//
import Firebase

struct UserService {
  static let shared = UserService()
  
  func fetchUser(uid: String, completion: @escaping(User) -> Void) {
    REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in

      guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
       
      let user = User(uid: uid, dictionary: dictionary)
      completion(user)
      
    }
  }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        REF_USERS.observe(.childAdded) { snapshot in
            let uid = snapshot.key
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            users.append(user)
            completion(users)
        }
    }
}
