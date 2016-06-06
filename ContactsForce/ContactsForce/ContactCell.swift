//
//  ContactCell.swift
//  ContactsForce
//
//  Created by William Welbes on 6/6/16.
//  Copyright © 2016 Centare. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var emailLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
