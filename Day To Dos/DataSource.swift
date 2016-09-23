//
//  DataSource.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/21/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import Foundation

class DataSource:NSObject {
    /**
     A Dictionary of tasks organized by date
     */
    var tasks = [String:[Task]]()
    
    var retrievalDate = ""
    
    let defaults = UserDefaults.standard
    
    /**
     Adds a task to the list of a particular day
     - parameters:
        - task: The task that will be added
     - returns: Void
     */
    func add(task:String) {
        let aTask = Task(name: task, completed: false)
        var taskArray = tasks[retrievalDate]
        taskArray?.append(aTask)
        tasks[retrievalDate] = taskArray
    }
    
    /**
     Returns Task for an index on a particular day
     - parameters:
        - index: The index of the task that will be returned
     - returns: (String, Bool)
     */
    func taskAtIndex(index:Int) -> (name:String, completed:Bool) {
        
        let taskArray = tasks[retrievalDate]
        let task = taskArray?[index]
        return (name:task!.name , completed:task!.completed)
        
    }

    /**
     Toggles the completion state of a task at a given index for a specific date
     - parameters:
        - index: The index of the task that will have it's completion state toggled
     - returns: Void
     */
    func toggleCompletion(index: Int) {
        var taskArray = tasks[retrievalDate]
        var task = taskArray?[index]
        task?.completed = !(task?.completed)!
        taskArray?[index] = task!
        tasks[retrievalDate] = taskArray
    }
    
    /**
     Returns the Number of Tasks for certain day
     - returns: Int
     */
    func taskCount() -> Int {
        
        let taskArray = tasks[retrievalDate]
        return (taskArray?.count)!
        
    }
    
    /**
     Delete the task at a specific index for a particular day
     - parameters:
        - index: The index of the task that will be deleted
     - returns: Void
     */
    func delete(index:Int){
        var taskArray = tasks[retrievalDate]
        taskArray?.remove(at: index)
        tasks[retrievalDate] = taskArray
    }
    
    /** 
     Add some default tasks to the list for Today's date
     - returns: Void
     */
    func setupDefaultData(){
        
        let date = Date() // Get todays date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        retrievalDate = dateFormatter.string(from: date) // Create date string
        
        add(task:"Eggs")
        add(task:"Milk")
        add(task:"Butter")
        add(task:"Sugar")
        add(task:"Apples")
        add(task:"Salad")
        
        defaults.set(true, forKey: Keys.initialized.rawValue) //Set the flag
        defaults.synchronize() //Save the changes immediately
        
    }
    
}
