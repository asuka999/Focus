//
//  Focus.swift
//  Focus
//
//  Created by WongYashu on 2/3/19.
//  Copyright © 2019 yasmina. All rights reserved.
//

import Cocoa

class Focus: NSScriptCommand {
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    
    override func performDefaultImplementation() -> Any? {
        if let task = self.directParameter as? String, let time = self.evaluatedArguments?["time"] as? Int {
            return self.appDelegate.taskController.focus(title: task, time: time)
        }
        
        return nil
    }
    

}
