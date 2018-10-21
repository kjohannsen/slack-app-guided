//
//  AuthServices.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/20/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    // These variables look into the user defaults to get the status of whether someone is logged in, their auth token, and their email. They then set a new value (if needed?)
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    // Web requests are asynchronous, meaning we don't know when it will finish. We set up a completion handler to let us know when it's finished.
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            // After typing in .responseString, press enter (twice) to get this closure syntax.
            // This code determines what to do if the request worked or comes back with an error.
            if response.result.error == nil {
                completion(true) // The completion handler input.
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
