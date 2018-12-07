//
//  TaskController.swift
//  Task
//
//  Created by Steve Lederer on 12/4/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation
import CoreData

//var mockTasks: [Task] {
//    let data = [Task(name: "Brush Teeth", notes: "Use Toothpaste", due: nil, isComplete: false),
//                Task(name: "Go to Gym", notes: "Practice your Handstands", due: Date(timeIntervalSinceNow: 50000), isComplete: false),
//                Task(name: "Take out the Dog", notes: "Feed the dog after the walk", due: Date(timeIntervalSinceNow: 25000), isComplete: true)]
//    return data
//}

class TaskController {
    static let shared = TaskController()
    
    // MARK: - Properties
    let fetchedResultsController: NSFetchedResultsController<Task> = {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true)]
        request.sortDescriptors = [NSSortDescriptor(key: "due", ascending: true)]
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
    }()
    
    init() {
        fetchedResultsController.delegate = self as? NSFetchedResultsControllerDelegate
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error in \(#function) :  \(error) \(error.localizedDescription)")
        }
    }
    
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistentStore()
    }
    func toggleIsCompleteFor(task: Task) {
        if task.isComplete == false {
            task.isComplete = true
        } else {
            task.isComplete = false
        }
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch let error {
            print("❌ There was an error saving playlist: \(error.localizedDescription)")
        }
    }
    func fetchTasks() -> [Task] {
//        return mockTasks
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try CoreDataStack.context.fetch(request)
        } catch let error {
            print("❌Error with fetch request in PlaylistController: \(error.localizedDescription)")
            return []
        }
    }
}
