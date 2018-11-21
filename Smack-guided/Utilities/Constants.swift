//
//  Constants.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/10/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import Foundation

// MARK: Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// MARK: User Defaults
let TOKEN = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// MARK: Completion Handler

/* A type alias is renaming a type (string, int, etc). It's like remapping an existing type to a new name.
CompletionHandler is of type "(_ Success: Bool) -> ()"
*/
typealias CompletionHandler = (_ Success: Bool) -> ()

// MARK: URLs
let BASE_URL = "https://slackchatclone.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
let URL_USER_ADD = "\(BASE_URL)/user/add"

// MARK: Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

// MARK: Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.3254901961, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

// MARK: Notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
