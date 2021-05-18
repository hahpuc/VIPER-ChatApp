//
//  RegisterInteractor.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class RegisterInteractor: RegisterInputInteractorProtocol {
    var presenter: RegisterOutputInteractorProtocol?
    
    func handleSignUp(user: User, password: String) {
        Auth.auth().createUser(withEmail: user.email, password: password) { (result, error) in
            
            if let error = error {
                print("Error to create new user ", error)
                self.presenter?.resultSignedUp(result: "Error")
            }
            
            guard let uid = result?.user.uid else { return }
            
            let dictionaryValues = ["email": user.email, "username": user.username]
            let values = [uid: dictionaryValues]
            
            let urlDatabase = "https://chatapp-firebase-f49ff-default-rtdb.asia-southeast1.firebasedatabase.app/"
            
            Database.database(url: urlDatabase).reference().child("Users").updateChildValues(values) { (error, reference) in
                if let error = error {
                    print("Error to setting on DB", error)
                    self.presenter?.resultSignedUp(result: "Error")
                }
                
                self.presenter?.resultSignedUp(result: "Success")
            }
            
            

        }
    }
}
