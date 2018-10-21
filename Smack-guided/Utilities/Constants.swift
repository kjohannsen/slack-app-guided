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

// MARK: User Defaults
let TOKEN = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// MARK: Completion Handler

/* A type alias is renaming a type (string, int, etc). It's like remapping an existing type to a new name.
CompletionHandler is of type "(_ Success: Bool) -> ()"
*/
typealias CompletionHandler = (_ Success: Bool) -> ()

// MARK: URL Constants
let BASE_URL = "https://slackchatclone.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)/account/register"
