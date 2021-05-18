//
//  RegisterProtocol.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit

protocol RegisterViewProtocol {
    // presenter -> view
    
    func showResult(result: String) 
}

protocol RegisterPresenterProtocol {
    // view -> presenter
    
    var view: RegisterViewProtocol? {get set}
    var interactor: RegisterInputInteractorProtocol? {get set}
    var router: RegisterRouterProtocol? {get set}
    
    func handleSignUp(user: User, password: String)
}

protocol RegisterInputInteractorProtocol {
    // presenter -> interactor
    
    var presenter: RegisterOutputInteractorProtocol? {get set}
    
    func handleSignUp(user: User, password: String) 

}

protocol RegisterOutputInteractorProtocol {
    // interactor -> presenter
    
    func resultSignedUp(result: String)
}

protocol RegisterRouterProtocol {
    // presenter -> router
    
    static func registerStart(registerRef: RegisterViewController)
}
