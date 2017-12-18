//
//  MenuItem.swift
//  CommandF
//
//  Created by Justin Bush on 2017-12-18.
//  Copyright © 2017 Justin Bush. All rights reserved.
//

import Cocoa

class MenuItem: NSObject {

    let name: String
    let dir: String
    
    init(dictionary: NSDictionary) {
        self.name = dictionary.object(forKey: "name") as! String
        self.dir = dictionary.object(forKey: "dir") as! String
    }
    
}
