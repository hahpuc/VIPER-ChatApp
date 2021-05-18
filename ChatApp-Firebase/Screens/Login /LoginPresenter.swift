//
//  LoginPresenter.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseAuth

class LoginPresenter: LoginPresenterProtocol {
    var view: LoginViewProtocol?
    
    var interactor: LoginInputInteractorProtocol?
    
    var router: LoginRouterProtocol?
    
    func handleLogin(email: String, password: String) {
        interactor?.handleLogin(email: email, password: password)
    }
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func resultDidFetch(result: AuthDataResult) {
        view?.showResult(result: result)
    }
}
