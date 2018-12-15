//
//  Channel.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 11/28/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import Foundation

struct Channel {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
    
    init(channelTitle: String!, channelDescription: String!, id: String!) {
        self.channelTitle = channelTitle
        self.channelDescription = channelDescription
        self.id = id
    }
}
