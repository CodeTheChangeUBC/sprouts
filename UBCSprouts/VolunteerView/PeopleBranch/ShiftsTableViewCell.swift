//
//  ShiftsTableViewCell.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-06-21.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class ShiftsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
