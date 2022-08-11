//
//  ProfileHeaderViewModel.swift
//  TwitterApp
//
//  Created by Wagner Barboza Goulart on 09/08/22.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
case tweets
case replies
case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

// MARK: - ProfileHeaderViewModel

struct ProfileHeaderViewModel {
    
    private let user: User
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 0, text: "Followers")
    }
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 300, text: "Following")
    }
    
    var actionButtonTitle: String {
        // if user is corrent user then set to edit profile // else figure out following/not following
        user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    init(user: User){
        self.user = user
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: " \(value)",
                                                        attributes: [.font :
                                                                        UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSAttributedString(string: " \(text)",
                                                  attributes: [.font:
                                                                UIFont.systemFont(ofSize: 14),
                                                               .foregroundColor:
                                                                UIColor.lightGray]))
        return attributedTitle
    }
}
