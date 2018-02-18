//
//  Meal.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation

struct Meal {
    
    var name: String!
    var price: Int! // Price in pennies
    var ingredients: [Ingredient]!
    
    init(withName name: String, atPrice price: Int, withIngredients ingredients: [Ingredient]) {
        self.name = name
        self.price = price
        self.ingredients = ingredients
    }
    
    func getPriceAsString() -> String! {
        return "$" + String(Double(price)/100.0)
    }
    
}
