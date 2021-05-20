//
//  ChatLogsViewController.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit
import FirebaseAuth
import MessageKit
import InputBarAccessoryView

class ChatLogsViewController: MessagesViewController, ChatLogsViewProtocol {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var presenter: ChatLogsPresenterProtocol?
    
    var currentUser: Sender? = nil
    var otherUser: Sender? = nil
    
    var userChattingWith: User?
    
    var messages: [Message] = []
    
    var chatLogsFetched: [ChatMessage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
        presenter?.showUserNameChattingWith()
        
        setUpCurrentUser()
        setUpOtherUser()
        
        presenter?.fetchChatLogs(from: currentUser!, to: otherUser!)
    }
    
    func setUpMessagesChatLogs() {
        
        for (child) in chatLogsFetched {
            print("INDEX: have child: \(child.fromID)")
            
//            messages.append(Message(sender: child.fromID as! SenderType, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text(child.text)))
        }

        messages.append(Message(sender: currentUser!, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hello my friend")))

        messages.append(Message(sender: otherUser!, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Oh nice to meet you too!")))

        messages.append(Message(sender: currentUser!, messageId: "3", sentDate: Date().addingTimeInterval(-86400), kind: .text("Do u wanna date with me?")))

        messages.append(Message(sender: otherUser!, messageId: "4", sentDate: Date().addingTimeInterval(-86400), kind: .text("This's awsome")))

        messages.append(Message(sender: otherUser!, messageId: "5", sentDate: Date().addingTimeInterval(-86400), kind: .text("Waiting at home til me come")))
    }
    
    func setUpCurrentUser() {
        let uid = Auth.auth().currentUser?.uid
        let displayName = Auth.auth().currentUser?.email
        
        currentUser = Sender(senderId: uid!, displayName: displayName!)
    }
    
    func setUpOtherUser() {
        let uid = userChattingWith?.uid
        let displayName = userChattingWith?.username
        
        otherUser = Sender(senderId: uid!, displayName: displayName!)
    }
    
    func showUserNameChattingWith(with user: User) {
        self.title = user.username
        
        self.userChattingWith = user
    }
    
    func showChatLogsFetched(chatMessages: [ChatMessage]) {
        self.chatLogsFetched = chatMessages
        
        self.setUpMessagesChatLogs()
        
        DispatchQueue.main.async {
            self.messagesCollectionView.reloadData()
        }
    }
}

// MARK: - Extension

extension ChatLogsViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        guard !text.replacingOccurrences(of: " ", with: "").isEmpty else { return }
    
        presenter?.performSendMessage(text, from: currentUser!, to: otherUser!)
        
        inputBar.inputTextView.text = ""
    }
}

extension ChatLogsViewController: MessagesDisplayDelegate {
    
}

extension ChatLogsViewController: MessagesLayoutDelegate {
     
}

extension ChatLogsViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return currentUser!
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        messages.count
    }
    
    
}
