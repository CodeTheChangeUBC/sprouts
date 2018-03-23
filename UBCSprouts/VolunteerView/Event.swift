//
//  Event.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-01.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation

struct Event {
    
    var name: String!
    var description: String!
    var id: Int!
    
    init(called name: String, describedAs description: String, withID id: Int) {
        self.name = name
        self.description = description
        self.id = id
    }
    
}
