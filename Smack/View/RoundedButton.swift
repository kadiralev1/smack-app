//
//  RoundedButton.swift
//  Smack
//
//  Created by Kadir Kutluhan Alev on 30.07.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import UIKit


@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    func setupView () {
        self.layer.cornerRadius = cornerRadius
    }
}
