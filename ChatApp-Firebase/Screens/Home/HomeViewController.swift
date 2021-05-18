//
//  HomeViewController.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Auth.auth().currentUser?.email
    }
    
    @IBAction func handleLogOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
}
