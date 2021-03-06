//
//  Task.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/21/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//


import Foundation

class Task:NSObject{
    var name:String = ""
    var completed:Bool = false
    
    init (name:String, completed:Bool){
        super.init()
        self.name = name
        self.completed = completed
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as? String, let completed = aDecoder.decodeObject(forKey:Keys.completed.rawValue) as? Bool
            
            else {
                return nil
        }
        
        self.init(name:name, completed:completed)
        
    }
}


extension Task:NSCoding{
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: Keys.name.rawValue)
        aCoder.encode(self.completed as NSNumber, forKey:Keys.completed.rawValue)
    }
}
