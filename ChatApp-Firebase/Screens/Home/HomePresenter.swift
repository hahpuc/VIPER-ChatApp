//
//  HomePresenter.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit
 
class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    
    var interactor: HomeInputInteractorProtocol?
    
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        self.loadUserList()
        self.loadLastestMessage()
    }
    
    func loadUserList() {
        interactor?.getUserFromFirebase()
    }
    
    func loadLastestMessage() {
        interactor?.getLastestMessageFromFirebase()
    }
    
    func pushUserToChatLogsScreen(with user: User, from view: UIViewController) {
        router?.pushUserToChatLogsScreen(with: user, from: view)
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    func userListDidFetch(users: [User]) {
        view?.showUserList(with: users)
    }
    
    func lastestMessageDidFetch(lastestMessages: [String : ChatMessage]) {
        view?.showLastestMessage(lastestMessages: lastestMessages)
    }
}
