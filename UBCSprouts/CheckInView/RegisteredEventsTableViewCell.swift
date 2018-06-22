//
//  RegisteredEventsTableViewCell.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-06-21.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class RegisteredEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
