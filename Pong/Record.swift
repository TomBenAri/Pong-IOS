//
//  Record.swift
//  Pong
//
//  Created by Tom Ben Ari on 24/01/2017.
//  Copyright © 2017 Tom Ben Ari. All rights reserved.
//

import UIKit

class Record: NSObject {
    
    
   var senderId: String!
    var userName: String!
    var date: String
    var winBy : Int = 0
    
     init?(senderId: String! ,userName: String!, date: String , winBy : Int) {
        self.senderId = senderId
       self.userName = userName
        self.date = date
        self.winBy = winBy
    }
}
