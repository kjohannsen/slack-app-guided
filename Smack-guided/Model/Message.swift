//
//  Message.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 12/15/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import Foundation

struct Message {
    public private(set) var message : String!
    public private(set) var userName : String!
    public private(set) var channelId : String!
    public private(set) var userAvatar : String!
    public private(set) var userAvatarColor : String!
    public private(set) var id : String!
    public private(set) var timeStamp : String!
    
    init(message: String!, userName: String!, channelId: String!, userAvatar: String!, userAvatarColor: String!, id: String!, timeStamp: String!) {
        self.message = message
        self.userName = userName
        self.channelId = channelId
        self.userAvatar = userAvatar
        self.userAvatarColor = userAvatarColor
        self.id = id
        self.timeStamp = timeStamp
    }
}

