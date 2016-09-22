//
//  DataSource.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/21/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import Foundation
import UIKit

class DataSource:NSObject {
    /**
     A Dictionary of tasks organized by date
     */
    var tasks = [String:[Task]]()
    
    let defaults = UserDefaults.standard
    
    /**
     Adds a task to the list of a particular day
     - parameters:
        - task: The task that will be added
        - forDate: The date the task should be added to
     - returns: Void
     */
    func add(task:String, forDate: String) {
        let aTask = Task(name: task, completed: false)
        var taskArray = tasks[forDate]
        taskArray?.append(aTask)
        tasks[forDate] = taskArray
    }
    
    /**
     Returns Task for an index on a particular day
     - parameters:
        - index: The index of the task that will be returned
        - forDate: The date the task is found at
     - returns: (String, Bool)
     */
    func taskAtIndex(index:Int, forDate:String) -> (name:String, completed:Bool) {
        
        let taskArray = tasks[forDate]
        let task = taskArray?[index]
        return (name:task!.name , completed:task!.completed)
        
    }

    /**
     Toggles the completion state of a task at a given index for a specific date
     - parameters:
        - index: The index of the task that will have it's completion state toggled
        - forDate: The date of the task is found at
     - returns: Void
     */
    func toggleCompletion(index: Int, forDate: String) {
        var taskArray = tasks[forDate]
        var task = taskArray?[index]
        task?.completed = !(task?.completed)!
        taskArray?[index] = task!
        tasks[forDate] = taskArray
    }
    
    /**
     Returns the Number of Tasks for certain day
     - parameters:
        - forDate: The date of the tasks we are counting
     - returns: Int
     */
    func taskCount(forDate: String) -> Int {
        
        let taskArray = tasks[forDate]
        return (taskArray?.count)!
        
    }
    
    /**
     Delete the task at a specific index for a particular day
     - parameters:
        - index: The index of the task that will be deleted
        - forDate: The date the task that will be deleted is found at
     - returns: Void
     */
    func delete(index:Int, forDate: String){
        var taskArray = tasks[forDate]
        taskArray?.remove(at: index)
        tasks[forDate] = taskArray
    }
    
    /** 
     Add some default tasks to the list for Today's date
     - returns: Void
     */
    func setupDefaultData(){
        
        let date = Date() // Get todays date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date) // Create date string
        
        add(task:"Eggs",    forDate: dateString)
        add(task:"Milk",    forDate: dateString)
        add(task:"Butter",  forDate: dateString)
        add(task:"Sugar",   forDate: dateString)
        add(task:"Apples",  forDate: dateString)
        add(task:"Salad",   forDate: dateString)
        
        defaults.set(true, forKey: Keys.initialized.rawValue) //Set the flag
        defaults.synchronize() //Save the changes immediately
        
    }
    
}
