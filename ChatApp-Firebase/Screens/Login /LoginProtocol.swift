//
//  LoginProtocol.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseAuth

protocol LoginViewProtocol {
    // presenter -> View
    
    func showResult(result: AuthDataResult)
}

protocol LoginPresenterProtocol {
    // View -> presenter
    var view: LoginViewProtocol? {get set}
    var interactor: LoginInputInteractorProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
 
    func handleLogin(email: String, password: String)
}

protocol LoginInputInteractorProtocol {
    // presenter -> interactor
    var presenter: LoginOutputInteractorProtocol? {get set}
    
    func handleLogin(email: String, password: String)
}

protocol LoginOutputInteractorProtocol {
    // interactor -> presenter
    func resultDidFetch(result: AuthDataResult)
}


protocol LoginRouterProtocol {
    // presenter -> router
    static func loginStart(loginRef: LoginViewController)
}
