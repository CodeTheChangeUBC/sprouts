//
//  IngredientStock.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation

struct IngredientStock {
    
    var ingredient: Ingredient!
    var maxAmount: Float!
    
    init(withName name: String, forAmount amount: Float, forMaxAmount maxAmount: Float, inUnits unit: String) {
        ingredient = Ingredient(withName: name, forAmount: amount, inUnits: unit)
        self.maxAmount = maxAmount
    }
    
    init(forIngredient ingredient: Ingredient, forMaxAmount maxAmount: Float) {
        self.ingredient = ingredient
        self.maxAmount = maxAmount
    }
    
    func getQuantityAsString() -> String {
        return "\(ingredient.amount!)/\(maxAmount!) \(ingredient.unit!)"
    }
    
}
