//
//  ViewController.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/21/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import UIKit

enum Keys:String{
    case initialized
    case name
    case completed
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource =  appDelegate.data
        tableView.delegate = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationItem.title = appDelegate.data.retrievalDate
        navigationItem.backBarButtonItem?.title = "back"
        
    }
    
    @IBAction func addPressed(_ sender: AnyObject) {
        
        var textField:UITextField?
        
        let alert = UIAlertController(title: "New Task", message: "Enter task name", preferredStyle: .alert)
        
        alert.addTextField { (field) in
            textField = field
            
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let name = textField?.text else {return}
            self.appDelegate.data.add(task: name)
            self.tableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        
        alert.addAction(addAction)
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
