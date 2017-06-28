//
//  WallRecord.swift
//  Pong
//
//  Created by Tom Ben Ari on 17/01/2017.
//  Copyright © 2017 Tom Ben Ari. All rights reserved.
//

import UIKit
import Firebase

class WallRecord: NSObject {

    
    
    let id : String
    let userName : String
    let date : String
    let winBay : Int
    
    init?(id : String, dict : [String:Any]) {
        self.id = id
        guard let uname = dict["userName"] as? String,
            let timestamp = dict["date"] as? String,
            let winBay = dict["winBay"] as? Int
            else {
                return nil
        }
        
        self.userName = uname
        self.date = timestamp
        self.winBay = winBay
    }
    
    
    func record() -> Record{
    return  Record(senderId: id, userName: userName, date: date, winBy: winBay)!
    }
    
    

}
