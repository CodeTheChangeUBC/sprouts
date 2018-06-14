//
//  IngredientTableViewCell.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    var index = -1
    
    var delegate: ReplenishDelegate?

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var quantityLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func replenishOne(_ sender: UIButton) {
        delegate?.replenish(forIndex: index)
    }
    
}

protocol ReplenishDelegate {
    func replenish(forIndex index: Int)
}
