//
//  DataSourceExtension.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/22/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import Foundation
import UIKit

extension DataSource:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = taskCount(forDate: "")
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard   let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskCell else {return UITableViewCell()}
        
        let task = taskAtIndex(index: indexPath.row, forDate: "")
        
        cell.taskLabel.attributedText =  format(text: task.name, strike: task.completed)
        
        cell.statusImageView?.image = task.completed ? UIImage(named: "Checked Box") : UIImage(named: "Check Box")
        
        return cell
        
    }
    
    func format(text:String, strike:Bool) -> NSAttributedString{
        
        
        if strike {
            return NSAttributedString(string: text, attributes: [NSStrikethroughStyleAttributeName:NSNumber(value:NSUnderlineStyle.styleSingle.rawValue)])
        }
        return  NSAttributedString(string: text, attributes: [NSStrikethroughStyleAttributeName:NSNumber(value:NSUnderlineStyle.styleNone.rawValue)])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            delete(index: indexPath.row, forDate: "")
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        default:
            break
        }
    }
}
