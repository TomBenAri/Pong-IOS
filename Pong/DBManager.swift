//
//  DBManager.swift
//  Pong
//
//  Created by Tom Ben Ari on 16/01/2017.
//  Copyright © 2017 Tom Ben Ari. All rights reserved.
//

import UIKit
import Firebase


class DBManager: NSObject {

 

    static let manager = DBManager()
    
    var rootRef : FIRDatabaseReference!
    private var wallRef : FIRDatabaseReference!
    var finalArray : [Record] = []
    override init(){
        super.init()
        
        rootRef = FIRDatabase.database().reference()
        wallRef = rootRef.child("Wall")
        
        
        wallRef.queryLimited(toLast: 25).observe(.childAdded, with: { snapshot in
           
        
           
            guard let value = snapshot.value as? [String:Any] else {
                return
            }
            
            
            
            guard let wallRecord = WallRecord(id: snapshot.key, dict: value) else {
                return
            }
            
            self.finalArray.append(wallRecord.record())
                
           
           
            
        })
        
    }
    
    
    

    func creatNewReacord (name : String, date: String,  winBy : Int){
        
        
        let wallDict : [String : Any] = [
            "date":date,
            "userName":name,
            "winBay":winBy
        ]
        
        wallRef.childByAutoId().setValue(wallDict)
    }
    


    
}
