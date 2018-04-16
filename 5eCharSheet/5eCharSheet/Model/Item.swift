//
//  Item.swift
//  5eCharSheet
//
//  Created by Student on 4/16/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import Foundation
class Item: NSObject, NSCoding {
    
    var name:String
    var info: String
    
    init(name:String,info:String){
        self.name = name
        self.info = info
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let info = aDecoder.decodeObject(forKey: "info") as! String
        self.init(name: name, info: info)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(info, forKey: "info")
    }
}
