//
//  HomeProtocol.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit

protocol HomeViewProtocol {
    // presenter -> view
    
    func showUserList(with users: [User])
    func showLastestMessage(lastestMessages: [String: ChatMessage])
}

protocol HomePresenterProtocol {
    // view -> presenter
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInputInteractorProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
    
    func viewDidLoad()
    
    func pushUserToChatLogsScreen(with user: User, from view: UIViewController)
}

protocol HomeInputInteractorProtocol {
    // presenter -> interactor
    var presenter: HomeOutputInteractorProtocol? {get set}

    func getUserFromFirebase()
    func getLastestMessageFromFirebase()
}

protocol HomeOutputInteractorProtocol {
    // interactor -> presenter
    
    func userListDidFetch(users: [User])
    func lastestMessageDidFetch(lastestMessages: [String: ChatMessage])
}
 
protocol HomeRouterProtocol {
    // presenter -> router
    static func homeStart(homeRef: HomeViewController)
    
    func pushUserToChatLogsScreen(with user: User, from view: UIViewController)

}
