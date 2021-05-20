//
//  ChatLogsInteractor.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit
import FirebaseDatabase

class ChatLogsInteractor: ChatLogsInputInteractorProtocol {
    var presenter: ChatLogsOutputInteractorProtocol?
    
    func performSendMessage(_ text: String, from currentUser: Sender, to otherUser: Sender) {
        
        let urlDatabase = "https://chatapp-firebase-f49ff-default-rtdb.asia-southeast1.firebasedatabase.app/"
        
        let reference = Database.database(url: urlDatabase).reference().child("User-Messages/\(currentUser.senderId)/\(otherUser.senderId)").childByAutoId()
        let toReference = Database.database(url: urlDatabase).reference().child("User-Messages/\(otherUser.senderId)/\(currentUser.senderId)").childByAutoId()
        
        let lastestMessageReference = Database.database(url:  urlDatabase).reference().child("Lastest-Messages/\(currentUser.senderId)/\(otherUser.senderId)")
        let toLastestMessageReference = Database.database(url: urlDatabase).reference().child("Lastest-Messages/\(otherUser.senderId)/\(currentUser.senderId)")
        
        let messageValue = [
            "fromID": currentUser.senderId,
            "toID": otherUser.senderId,
            "text": text,
        ]
        
        reference.updateChildValues(messageValue)
        toReference.updateChildValues(messageValue)
        
        lastestMessageReference.setValue(messageValue)
        toLastestMessageReference.setValue(messageValue)
    }
    
    func fetchChatLogs(from currentUser: Sender, to otherUser: Sender) {
        let urlDatabase = "https://chatapp-firebase-f49ff-default-rtdb.asia-southeast1.firebasedatabase.app/"
        
        Database.database(url: urlDatabase).reference().child("User-Messages").child(currentUser.senderId).child(otherUser.senderId).observeSingleEvent(of: .value) { (snapshot) in
            
            var chatlogs: [ChatMessage] = []
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.value as! [String: Any]
                
                let fromID = placeDict["fromID"] as! String
                let text = placeDict["text"] as! String
                let toID = placeDict["toID"] as! String
                let chatMessage = ChatMessage(fromID: fromID, text: text, toID: toID)
                
                chatlogs.append(chatMessage)
            }
            
            self.presenter?.chatLogsFetched(chatMessages: chatlogs)
        }
    }
}

