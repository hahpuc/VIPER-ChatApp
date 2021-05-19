//
//  ChatLogsProtocol.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit

protocol ChatLogsViewProtocol {
    // presenter -> view
    func showUserNameChattingWith(with user: User) 
}

protocol ChatLogsPresenterProtocol {
    // view -> presenter
        
    var view: ChatLogsViewProtocol? {get set}
    var router: ChatLogsRouterProtocol? {get set}
    var interactor: ChatLogsInputInteractorProtocol? {get set}
    
    func showUserNameChattingWith()
    func performSendMessage(_ text: String, from currentUser: Sender, to otherUser: Sender)
}

protocol ChatLogsInputInteractorProtocol {
    // presenter -> interactor
    var presenter: ChatLogsOutputInteractorProtocol? {get set}
    
    func performSendMessage(_ text: String, from currentUser: Sender, to otherUser: Sender)
}

protocol ChatLogsOutputInteractorProtocol {
    // interactor -> presenter
}

protocol ChatLogsRouterProtocol {
    // presenter -> router
    
    static func chatLogsStart(chatLogsRef: ChatLogsViewController, with user: User)
}

