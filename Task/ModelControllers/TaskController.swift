//
//  TaskController.swift
//  Task
//
//  Created by Steve Lederer on 12/4/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation
import CoreData

var mockTasks: [Task] {
    [Task(name: "Brush Teeth", note: "Use Toothpaste"),
     Task(name: "Go to Gym", note: "Don't Forget to Practice Handstands", isComplete: true)
    ]
}

/*
var mockAlarms = {
    [Alarm(fireDate: Date(timeIntervalSinceNow: 100 * 60), name: "Wake Up", enabled: true),
     Alarm(fireDate: Date(timeIntervalSinceNow: 900 * 60), name: "Gym", enabled: true),
     Alarm(fireDate: Date(timeIntervalSinceNow: 1200 * 60), name: "Class", enabled: true)
    ]
} */

class TaskController {
    static let shared = TaskController()
    
    var tasks: [Task] = []
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    func remove(task: Task) {
        
    }
    
    func saveToPersistentStore() {
        
    }
    func fetchTasks() -> [Task] {
        
    }
}
