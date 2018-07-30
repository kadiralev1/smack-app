//
//  Constants.swift
//  Smack
//
//  Created by Kadir Kutluhan Alev on 30.07.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import Foundation




typealias CompletionHandler = (_ Success:Bool) -> ()


// URL

let BASE_URL = "https://chatapppp.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"


// SEGUES

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


// User Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
