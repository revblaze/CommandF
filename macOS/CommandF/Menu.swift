//
//  Menu.swift
//  CommandF
//
//  Created by Justin Bush on 2017-12-18.
//  Copyright © 2017 Justin Bush. All rights reserved.
//

import Cocoa

class Menu: NSObject {

    let list: String
    var child = [MenuItem]()
    
    init(list: String) {
        self.list = list
    }
    
    class func menuList(_ fileName: String) -> [Menu] {
        var menus = [Menu]()
        
        if let menuList = NSArray(contentsOfFile: fileName) as? [NSDictionary] {

            for menuItems in menuList {
                let menu = Menu(list: menuItems.object(forKey: "list") as! String)
                let items = menuItems.object(forKey: "items") as! [NSDictionary]

                for dict in items {
                    let item = MenuItem(dictionary: dict)
                    menu.child.append(item)
                }
                
                menus.append(menu)
            }
        }
        
        return menus
    }

}
