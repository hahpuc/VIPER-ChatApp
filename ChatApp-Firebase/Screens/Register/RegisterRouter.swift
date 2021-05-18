//
//  RegisterRouter.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit

typealias RegisterEntryPoint = RegisterPresenterProtocol & RegisterOutputInteractorProtocol

class RegisterRouter: RegisterRouterProtocol {
    static func registerStart(registerRef: RegisterViewController) {
        let presenter: RegisterEntryPoint = RegisterPresenter()
        
        registerRef.presenter = presenter
        registerRef.presenter?.router = RegisterRouter()
        registerRef.presenter?.view = registerRef
        registerRef.presenter?.interactor = RegisterInteractor()
        registerRef.presenter?.interactor?.presenter = presenter
        
    }
    
    
}
