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
    }
    
    func loadUserList() {
        interactor?.getUserFromFirebase()
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    func userListDidFetch(users: [User]) {
        view?.showUserList(with: users)
    }
}
