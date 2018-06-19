//
//  IngredientTableViewCell.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    private var index = -1
    
    var delegate: ReplenishDelegate?

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var quantityLabel: UITextField!
    @IBOutlet weak var lowOnStockLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setIndex(as newInt: Int) {
        index = newInt
    }
    
    func getIndex() -> Int {
        return index
    }

    @IBAction func replenishOne(_ sender: UIButton) {
        delegate?.replenish(forIndex: index)
    }

    
}

protocol ReplenishDelegate {
    func replenish(forIndex index: Int)
}
