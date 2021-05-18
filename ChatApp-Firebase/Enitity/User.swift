//
//  User.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit

struct User {
    
    init(email: String, username: String) {
        self.email = email
        self.username = username
    }
    
    let email: String
    let username: String
}

