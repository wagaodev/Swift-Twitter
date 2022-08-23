//
//  UserCell.swift
//  TwitterApp
//
//  Created by Wagner Barboza Goulart on 23/08/22.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
