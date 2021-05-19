//
//  RegisterViewController.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseDatabase

class RegisterViewController: UIViewController, RegisterViewProtocol { 
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: RegisterPresenterProtocol?
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterRouter.registerStart(registerRef: self)

    }
    
    func showResult(result: String) {
        if (result == "Success") {
            let alert = UIAlertController(title: "Create an Account", message: "Successfully to sign up.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        } else if (result == "Error") {
            let alert = UIAlertController(title: "Something wrong!", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func handleSignUp(_ sender: Any) {
    
        print("Start to SignUp")
        let email = emailTextField.text
        let username = userNameTextField.text
        let password = passwordTextField.text
    
        let newUser = User(email: email ?? "", username: username ?? "", uid: "")
        presenter?.handleSignUp(user: newUser, password: password ?? "")
        

    }
}
