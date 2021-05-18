//
//  Router.swift
//  6-VIPER-achitecture
//
//  Created by Long Nguyễn on 11/05/2021.
//

import UIKit

typealias LoginEntryPoint = LoginPresenterProtocol & LoginOutputInteractorProtocol

class LoginRouter: LoginRouterProtocol {
    
    static func loginStart(loginRef: LoginViewController) {
        let presenter: LoginEntryPoint = LoginPresenter()
        
        loginRef.presenter = presenter 
        loginRef.presenter?.router = LoginRouter()
        loginRef.presenter?.view = loginRef
        loginRef.presenter?.interactor = LoginInteractor()
        loginRef.presenter?.interactor?.presenter = presenter
    }
}
