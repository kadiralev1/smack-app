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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //  one time var daha sonra ımage secılecegı ve ısım verılcegı zaman degısecek sımdılık sadece denemelık
    
    var avatarName = "profileDefault"
    var avatarColor = "[05,0.5,0.5,1]"
    var bgColor : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named:UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
     }
    
    @IBAction func closePressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        // dismiss(animated: true, completion: nil) bir ekran geri gitmek için bu
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text , usernameTxt.text != "" else {return}
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passTxt.text , passTxt.text != ""   else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name:NOTIF_USER_DATA_DID_CHANGE, object:nil)
                            }
                        })
                    }
                })
            }
        }
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r),\(g),\(b),1]"
        UIView.animate(withDuration: 0.2) {
                self.userImg.backgroundColor=self.bgColor
        }
        
    }
   
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    func setupView(){
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor:smackPurplePlaceHolder])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor:smackPurplePlaceHolder])
        passTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor:smackPurplePlaceHolder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    @objc func handleTap () {
        view.endEditing(true)
    }
}
