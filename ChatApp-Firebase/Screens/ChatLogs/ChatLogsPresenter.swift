//
//  ChatLogsPresenter.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit

class ChatLogsPresenter: ChatLogsPresenterProtocol { 
    var view: ChatLogsViewProtocol?
    
    var router: ChatLogsRouterProtocol?
    
    var interactor: ChatLogsInputInteractorProtocol?
    
    var userChattingWith: User!
    
    func showUserNameChattingWith() {
        view?.showUserNameChattingWith(with: userChattingWith)
    }
    
    func performSendMessage(_ text: String, from currentUser: Sender, to otherUser: Sender) {
        interactor?.performSendMessage(text, from: currentUser, to: otherUser)
    }
    
    func fetchChatLogs(from currentUser: Sender, to otherUser: Sender) {
        interactor?.fetchChatLogs(from: currentUser, to: otherUser)
    }
}

extension ChatLogsPresenter: ChatLogsOutputInteractorProtocol {
    func chatLogsFetched(chatMessages: [ChatMessage]) {
        view?.showChatLogsFetched(chatMessages: chatMessages)
    }
}
