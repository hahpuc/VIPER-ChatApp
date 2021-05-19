//
//  HomeRouter.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 19/05/2021.
//

import UIKit

typealias HomeEntryPoint = HomePresenterProtocol & HomeOutputInteractorProtocol

class HomeRouter: HomeRouterProtocol {
    static func homeStart(homeRef: HomeViewController) {
        let presenter: HomeEntryPoint = HomePresenter()
        
        homeRef.presenter = presenter
        homeRef.presenter?.router = HomeRouter()
        homeRef.presenter?.view = homeRef
        homeRef.presenter?.interactor = HomeInteractor()
        homeRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
