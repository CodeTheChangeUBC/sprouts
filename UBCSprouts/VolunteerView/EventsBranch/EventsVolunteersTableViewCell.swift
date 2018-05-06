//
//  EventsVolunteersTableViewCell.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-05-02.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class EventsVolunteersTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var index = -1
    var delegate: VolunteerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func checkOut(_ sender: UIButton) {
        delegate?.checkout(atIndex: index)
    }
}

protocol VolunteerDelegate {
    func checkout(atIndex index: Int)
}
