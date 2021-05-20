//
//  HomeLastestMessageCell.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit

class HomeLastestMessageCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var lastestMessageLabel: UILabel!
    
    func setUserName(_ username: String) {
        self.userNameLabel.text = username
    }
    
    func setLastestMEssage(_ lastesMessage: String) {
        self.lastestMessageLabel.text = lastesMessage
    }
}
