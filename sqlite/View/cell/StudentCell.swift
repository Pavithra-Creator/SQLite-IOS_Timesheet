//
//  StudentCell.swift
//  sqlite
//
//  Created by Azar on 12/26/20.
//  Copyright © 2020 Pavithra. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
	
    @IBOutlet weak var lbl_Name: UILabel!
    
    @IBOutlet weak var lbl_Mark: UILabel!
    
  
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
