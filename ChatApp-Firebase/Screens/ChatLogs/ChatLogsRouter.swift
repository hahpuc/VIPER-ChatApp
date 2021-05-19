//
//  ChatLogsRouter.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit

typealias ChatLogsEntryPoint = ChatLogsPresenterProtocol & ChatLogsOutputInteractorProtocol

class ChatLogsRouter: ChatLogsRouterProtocol {
    static func chatLogsStart(chatLogsRef: ChatLogsViewController, with user: User) {
        
        let presenter = ChatLogsPresenter()
        
        presenter.userChattingWith = user

        chatLogsRef.presenter = presenter
        chatLogsRef.presenter?.view = chatLogsRef
        chatLogsRef.presenter?.router = ChatLogsRouter()
        chatLogsRef.presenter?.interactor = ChatLogsInteractor()
        chatLogsRef.presenter?.interactor?.presenter = presenter
        
    }
    

}
