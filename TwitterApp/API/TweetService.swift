//
//  TweetService.swift
//  TwitterApp
//
//  Created by WAGNER GOULART on 19/03/22.
//

import Firebase

struct TweetService {
  static let shared = TweetService()
  
  func uploadTweet(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void){
    guard let uid = Auth.auth().currentUser?.uid else { return }
    
    let values = ["uid": uid, "timestamp": Int(NSDate().timeIntervalSince1970), "likes": 0, "retweets": 0, "caption": caption] as [String : Any]
    
    REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
  }
}
