//
//  ViewControllerExtension.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/22/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appDelegate.data.toggleCompletion(index: indexPath.row)
        self.tableView.reloadData()
        
    }
}
