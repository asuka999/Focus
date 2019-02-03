//
//  AppDelegate.swift
//  Focus
//
//  Created by WongYashu on 2/2/19.
//  Copyright © 2019 yasmina. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   
    @IBOutlet weak var window: NSWindow!
    
    let taskController = TaskController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.taskController.initText()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    

}

