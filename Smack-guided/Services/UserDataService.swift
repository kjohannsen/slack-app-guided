//
//  UserDataService.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 11/14/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    //this means any other file can read it, but they can't set it
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    // when this function is called, it takes in arguments and sets the variables in this file.
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
