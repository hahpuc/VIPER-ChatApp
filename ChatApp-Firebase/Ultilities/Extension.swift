//
//  Extension.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 24/05/2021.
//

import UIKit


extension UIViewController {
    func dismissKey() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyBoard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
}

