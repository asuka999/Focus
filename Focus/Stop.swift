//
//  Stop.swift
//  Focus
//
//  Created by WongYashu on 2/3/19.
//  Copyright © 2019 yasmina. All rights reserved.
//

import Cocoa

class Stop: NSScriptCommand {
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    
    override func performDefaultImplementation() -> Any? {
        self.appDelegate.taskController.stop()
        return nil
    }
    

}
