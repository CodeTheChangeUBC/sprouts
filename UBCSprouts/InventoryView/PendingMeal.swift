//
//  PendingMeal.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation

struct PendingMeal {
    
    var meal: Meal!
    var state: PendingMealState
    
    mutating func nextState() {
        switch state {
        case .needed: state = .inProgress
        case .inProgress: state = .done
        case .done: state = .needed
        }
    }
    
    init(_ meal: Meal) {
        self.meal = meal
        self.state = .needed
    }
    
}

enum PendingMealState {
    case needed, inProgress, done
}
