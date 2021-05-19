//
//  User.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit

struct User {
    
    init(email: String, username: String, uid: String?) {
        self.email = email
        self.username = username
        self.uid = uid
    }
    
    let uid: String? 
    let email: String
    let username: String
}

