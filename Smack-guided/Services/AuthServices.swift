//
//  AuthServices.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/20/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    // MARK: Variables
    
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
    
    // MARK: Functions
    
    // Web requests are asynchronous, meaning we don't know when it will finish. We set up a completion handler to let us know when it's finished.
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
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
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
            // Regular JSON Parsing
                /*
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let email = json["user"] as? String {
                        self.userEmail = email
                    }
                    if let token = json["token"] as? String {
                        self.authToken = token
                    }
                }
                */
                
            // Parsing JSON with SwiftyJSON???
                guard let data = response.data else { return }
                let json = try? JSON(data: data)
                self.userEmail = (json?["user"].stringValue)!
                self.authToken = (json?["token"].stringValue)!
                
                self.isLoggedIn = true
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else {return}
                self.setUserData(data: data)
                
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else {return}
                self.setUserData(data: data)
                
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserData(data: Data) {
        let json = try? JSON(data: data)
        let id = (json?["_id"].stringValue)!
        let color = (json?["avatarColor"].stringValue)!
        let avatarName = (json?["avatarName"].stringValue)!
        let email = (json?["email"].stringValue)!
        let name = (json?["name"].stringValue)!
        
        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
    }
}
