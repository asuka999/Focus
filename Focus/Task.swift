//
//  Task.swift
//  Focus
//
//  Created by WongYashu on 2/3/19.
//  Copyright © 2019 yasmina. All rights reserved.
//

import Cocoa

class Task: NSObject {
    var remain: Double
    var prev: Double
    var title: String
    var running = false

    init(title: String, time: Int) {
        self.remain = Double(time)
        self.title = title
        self.prev = Date().timeIntervalSince1970
        self.running = true
    }

    func update() -> Bool {
        let now = Date().timeIntervalSince1970
        let currentRemain = remain - (Date().timeIntervalSince1970 - prev)
        if currentRemain > 0 {
            remain = currentRemain
            prev = now
            return true
        }
        
        return false
    }
    
    func run() {
        prev = Date().timeIntervalSince1970
        self.running = true
    }
    
    func pause() {
        self.running = false
    }
}
