//
//  IngredientStock.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation
import UserNotifications

struct IngredientStock {
    
    var ingredient: Ingredient!
    var maxAmount: Float!
    var minAmount: Float!
    
    init(withName name: String, forAmount amount: Float, forMaxAmount maxAmount: Float, forMinAmount minAmount: Float, inUnits unit: String) {
        ingredient = Ingredient(withName: name, forAmount: amount, inUnits: unit)
        self.maxAmount = maxAmount
        self.minAmount = minAmount
    }
    
    init(forIngredient ingredient: Ingredient, forMaxAmount maxAmount: Float, forMinAmount minAmount: Float) {
        self.ingredient = ingredient
        self.maxAmount = maxAmount
        self.minAmount = minAmount
    }

    
    func getMaxQuantityAsString() -> String {
        return "\(ingredient.amount!)/\(maxAmount!) \(ingredient.unit!)"
    }
    func getMinQuantityAsString() -> String {
        return "\(ingredient.amount!)/\(minAmount!) \(ingredient.unit!)"
    }

    func lowQuantityIngredient () -> Bool {
        if (ingredient.amount <= minAmount) {
        return true
        }
        else {
            return false
        }
    }
    
}
