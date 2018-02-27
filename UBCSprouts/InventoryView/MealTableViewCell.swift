//
//  MealTableViewCell.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    private var quantity = 0

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func quantityChanged(_ sender: UIStepper) {
        quantity = Int(sender.value)
        quantityLabel.text = String(quantity)
    }
    
    func getQuantity() -> Int {
        return quantity
    }

}
