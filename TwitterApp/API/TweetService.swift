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
    
    let values = ["uid": uid,
                  "timestamp": Int(NSDate().timeIntervalSince1970),
                  "likes": 0,
                  "retweets": 0,
                  "caption": caption] as [String : Any]
      
      let ref = REF_TWEETS.childByAutoId()
    
      ref.updateChildValues(values) { (err, ref) in
          guard let tweetID = ref.key else { return }
          REF_USER_TWEETS.child(uid).updateChildValues([tweetID: 1], withCompletionBlock: completion)
      }
  }
  
  
  func fetchTweets(completion: @escaping([Tweet]) -> Void){
    var tweets = [Tweet]()
    
    REF_TWEETS.observe(.childAdded) { snapshot in
      guard let dictionary = snapshot.value as? [String: Any] else { return }
      guard let uid = dictionary["uid"] as? String else { return }
      
      let tweetID = snapshot.key

      UserService.shared.fetchUser(uid: uid) { user in
        let tweet = Tweet(user: user, tweetID: tweetID, dictionary: dictionary)
        tweets.append(tweet)
        completion(tweets)
      }
    }
  }
}
