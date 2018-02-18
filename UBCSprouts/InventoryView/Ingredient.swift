//
//  Ingredient.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation

struct Ingredient {
    
    var name: String!
    var amount: Float!
    var unit: String!
    
    init(withName name: String, forAmount amount: Float, inUnits unit: String) {
        self.name = name
        self.amount = amount
        self.unit = unit
    }
    
}
