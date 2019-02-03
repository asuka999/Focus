//
//  TaskController.swift
//  Focus
//
//  Created by WongYashu on 2/3/19.
//  Copyright © 2019 yasmina. All rights reserved.
//

import Cocoa

class TaskController: NSScriptCommand, NSUserNotificationCenterDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    var task: Task? = nil
    var timer: Timer? = nil

    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }

    private func sendNotification(title: String, subtitle: String) {
        let userNotification = NSUserNotification()
        userNotification.title = title
        userNotification.subtitle = subtitle
        // userNotification.informativeText = "消息InformativeText"
        NSUserNotificationCenter.default.delegate = self
        NSUserNotificationCenter.default.scheduleNotification(userNotification)
    }
    
    private func setText(text: String) {
        if let button = statusItem.button {
            button.title = text
           
        }
    }
    
    func initText () {
        self.setText(text: "😎")
        if let button = statusItem.button {
           
            button.action = #selector(clear(_:))
        }
       
    }

    func toggle() {
        
        if task == nil {
            return
        }
        if (task?.running)! {
            task?.pause()
            timer?.invalidate()
        } else {
            task?.run()
            self.runTimer()
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        self.initText()
    }
    
    private func runTimer() -> Timer? {
        if self.task == nil {
            return nil
        }
        let task = self.task!
        let timer = Timer(timeInterval: 1, repeats: true) {_ in
            if task.update() {
                let remain = task.remain
                let sec = String(Int(remain) % 60).paddingToLeft(upTo: 2, using: "0")
                let min = String(Int(remain / 60)).paddingToLeft(upTo: 2, using: "0")
                self.setText(text: task.title + " - " + min + ":" + sec)
            } else {
                self.timer?.invalidate()
                self.setText(text: task.title + " - " + "😢")
                self.sendNotification(title: "times up!", subtitle: task.title)
            }
        }
        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
        timer.fire()
        return timer
    }

    func focus(title: String, time: Int) -> Any? {
        self.timer?.invalidate()
        self.task = Task(title: title, time: time)
        self.timer = self.runTimer()
        return nil
    }
    
    deinit {
        self.timer?.invalidate()
    }

    @objc func clear(_ sender: Any?) {

        if (self.task?.running)! && !(self.timer?.isValid)! {
            self.stop()
        }
    }
}


extension StringProtocol {
    func paddingToLeft(upTo length: Int, using element: Element) -> String {
        return String(repeatElement(element, count: Swift.max(0, length-count))) + suffix(Swift.max(count, count-length))
    }
}
