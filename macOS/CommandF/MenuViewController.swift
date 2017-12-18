//
//  MenuViewController.swift
//  CommandF
//
//  Created by Justin Bush on 2017-12-18.
//  Copyright © 2017 Justin Bush. All rights reserved.
//

import Cocoa

class MenuViewController: NSViewController {

    @IBOutlet weak var outlineView: NSOutlineView!
    var menus = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = Bundle.main.path(forResource: "MenuSource", ofType: "plist") {
            menus = Menu.menuList(filePath)
            print(menus)
        }
        
        outlineView.beginUpdates()
    }
}

extension MenuViewController: NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {

        if let menu = item as? Menu {
            return menu.child.count
        }

        return menus.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let menu = item as? Menu {
            return menu.child[index]
        }
        
        return menus[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let menu = item as? Menu {
            return menu.child.count > 0
        }
        
        return false
    }
}

extension MenuViewController: NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?

        /*
        if let menu = item as? Menu {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = menu.list
                textField.sizeToFit()
            }
        }
 */
        
        if let menuItem = item as? MenuItem {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {

                textField.stringValue = menuItem.name
                textField.sizeToFit()
            }
        
        /*
        if let menu = item as? Menu {
            if (tableColumn?.identifier)!.rawValue == "HeaderCell" {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    textField.stringValue = ""
                    textField.sizeToFit()
                }
            } else {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    textField.stringValue = menu.list
                    textField.sizeToFit()
                }
            }
        } else if let menuItem = item as? MenuItem {
            //1
            if (tableColumn?.identifier)!.rawValue == "HeaderCell" {
                //2
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as? NSTableCellView
                
                if let textField = view?.textField {
                    //3
                    //textField.stringValue = dateFormatter.string(from: menuItem.publishingDate)
                    textField.stringValue = "FAVORITES"
                    textField.sizeToFit()
                }
            } else {
                //4
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    //5
                    textField.stringValue = menuItem.name
                    textField.sizeToFit()
                }
            }
        */
        }
        //More code here
        return view
    }
}
