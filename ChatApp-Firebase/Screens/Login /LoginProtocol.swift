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
    
    func showResult(uid: String)
}

protocol LoginPresenterProtocol {
    // View -> presenter
    var view: LoginViewProtocol? {get set}
    var interactor: LoginInputInteractorProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
 
    func handleLogin(email: String, password: String)
    func pushUserAuthToHome(with uid: String, from view: UIViewController)
}

protocol LoginInputInteractorProtocol {
    // presenter -> interactor
    var presenter: LoginOutputInteractorProtocol? {get set}
    
    func handleLogin(email: String, password: String)
}

protocol LoginOutputInteractorProtocol {
    // interactor -> presenter
    func resultDidFetch(uid: String)
}


protocol LoginRouterProtocol {
    // presenter -> router
    
    func pushUserAuthToHome(with uid: String, from view: UIViewController)
    static func loginStart(loginRef: LoginViewController) 
}
