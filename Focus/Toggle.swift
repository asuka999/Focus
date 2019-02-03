//
//  Pause.swift
//  Focus
//
//  Created by WongYashu on 2/3/19.
//  Copyright © 2019 yasmina. All rights reserved.
//

import Cocoa

class Toggle: NSScriptCommand {
    let appDelegate = NSApplication.shared.delegate as! AppDelegate

    override func performDefaultImplementation() -> Any? {
        self.appDelegate.taskController.toggle()
        return nil
    }
}
