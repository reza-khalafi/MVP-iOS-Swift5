//
//  PetTableViewCell.swift
//  MY_MVP2
//
//  Created by Reza Khalafi on 7/21/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
