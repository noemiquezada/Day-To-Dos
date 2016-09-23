//
//  TaskCell.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/22/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
