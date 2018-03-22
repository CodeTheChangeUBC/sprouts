//
//  Volunteer.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-01.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation

struct Volunteer {
    
    var name: String!
    var id: Int!
    
    init(withName name: String, withID id: Int, havingWorkedThisTerm hoursWorkedThisTerm: Double, havingWorkedInTotal hoursWorkedTotal: Double) {
        self.name = name
        self.id = id
    }
    
}
