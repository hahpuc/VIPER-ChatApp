//
//  HomeInteractor.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeInteractor: HomeInputInteractorProtocol {
    var presenter: HomeOutputInteractorProtocol?
    
    func getUserFromFirebase() {
        let urlDatabase = "https://chatapp-firebase-f49ff-default-rtdb.asia-southeast1.firebasedatabase.app/"
        
        Database.database(url: urlDatabase).reference().child("Users").observeSingleEvent(of: .value) { (snapshot) in
            
            var users: [User] = []
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.value as! [String: Any]
                
                let usernameFetched = placeDict["username"] as! String
                let emailFetched = placeDict["email"] as! String
                let uidFetched = placeDict["uid"] as! String
                let user = User(email: emailFetched, username: usernameFetched, uid: uidFetched)
                
                users.append(user)
            }
            
            self.presenter?.userListDidFetch(users: users)
        }
    }
    
    func getLastestMessageFromFirebase() {
        let urlDatabase = "https://chatapp-firebase-f49ff-default-rtdb.asia-southeast1.firebasedatabase.app/"
        
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        
        Database.database(url: urlDatabase).reference().child("Lastest-Messages").child(currentUser).observeSingleEvent(of: .value) { (snapshot) in
            var lastestMessages: [String: ChatMessage] = [:]
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.value as! [String: Any]
                
                let fromID = placeDict["fromID"] as! String
                let text = placeDict["text"] as! String
                let toID = placeDict["toID"] as! String
                let lastestMessage = ChatMessage(fromID: fromID, text: text, toID: toID)
                
                lastestMessages[snap.key] = lastestMessage
            }
            
            self.presenter?.lastestMessageDidFetch(lastestMessages: lastestMessages)
            
            
        }
    }
}
