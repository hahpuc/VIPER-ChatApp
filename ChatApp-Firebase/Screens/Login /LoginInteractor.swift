//
//  LoginInteractor.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseAuth

class LoginInteractor: LoginInputInteractorProtocol {
    var presenter: LoginOutputInteractorProtocol?
    
    func handleLogin(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Error to log in: ", error)
            }
        
            self.presenter?.resultDidFetch(uid: result?.user.uid ?? "")
        }
    }
    
    
}
