//
//  RegisterPresenter.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit

class RegisterPresenter: RegisterPresenterProtocol {
    var view: RegisterViewProtocol?
    
    var interactor: RegisterInputInteractorProtocol?
    
    var router: RegisterRouterProtocol?
    
    func handleSignUp(user: User, password: String) {
        interactor?.handleSignUp(user: user, password: password)
    }
}

extension RegisterPresenter: RegisterOutputInteractorProtocol {
    func resultSignedUp(result: String) {
        view?.showResult(result: result)
    }
}
