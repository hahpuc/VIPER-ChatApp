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
    
    func pushUserAuthToHome(with uid: String, from view: UIViewController) {
        router?.pushUserAuthToHome(with: uid, from: view)
    }
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func resultDidFetch(uid: String) {
        view?.showResult(uid: uid)
    }
}
