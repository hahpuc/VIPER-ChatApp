//
//  ButtonDesignable.swift
//  5-MVP-achitecture
//
//  Created by Long Nguyễn on 05/05/2021.
//

import UIKit

@IBDesignable
class ButtonDesignable: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor = .white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
