//
//  LoginViewController.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, LoginViewProtocol {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: ButtonDesignable!
    
    var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        LoginRouter.loginStart(loginRef: self)
    }
    
    func showResult(result: AuthDataResult) {
        
        print("Success to login", result)
    }
    
    @IBAction func handleLogin(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        presenter?.handleLogin(email: email ?? "", password: password ?? "")
    }
    
}
