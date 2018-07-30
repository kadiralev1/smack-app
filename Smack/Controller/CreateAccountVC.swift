//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Kadir Kutluhan Alev on 30.07.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closePressed(_ sender: Any) {
        // dismiss(animated: true, completion: nil) bir ekran geri gitmek için bu
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
