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
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
//  Colors

let smackPurplePlaceHolder = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.7533443921)

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")


// SEGUES

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"   

// User Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]
