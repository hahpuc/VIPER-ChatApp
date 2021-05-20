//
//  Message.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import Foundation
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct ChatMessage {
    
    init(fromID: String, text: String, toID: String) {
        self.fromID = fromID
        self.text = text
        self.toID = toID
    }
    
    let fromID: String
    let text: String
    let toID: String 
}
