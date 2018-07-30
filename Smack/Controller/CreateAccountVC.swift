//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Kadir Kutluhan Alev on 30.07.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closePressed(_ sender: Any) {
        // dismiss(animated: true, completion: nil) bir ekran geri gitmek için bu
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    @IBAction func createAccuntPressed(_ sender: Any) {
        
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passTxt.text , passTxt.text != ""   else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("logged in user !",AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
        
    }
   
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
}
