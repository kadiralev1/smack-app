//
//  CircleImage.swift
//  Smack
//
//  Created by Kadir Kutluhan Alev on 31.07.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import UIKit
@IBDesignable
class CircleImage: UIImageView {

   
    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView () {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    } 
}
