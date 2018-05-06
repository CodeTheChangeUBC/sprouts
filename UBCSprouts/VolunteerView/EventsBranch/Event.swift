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
    var location: String!
    var description: String!
    var id: Int!
    var volunteers: [Volunteer]
    
    init(called name: String, atLocation location: String, describedAs description: String, withID id: Int) {
        self.name = name
        self.location = location
        self.description = description
        self.id = id
        volunteers = [Volunteer]()
    }
    
    init(called name: String, atLocation location: String, describedAs description: String, withID id: Int, withVolunteers volunteers: [Volunteer]) {
        self.name = name
        self.location = location
        self.description = description
        self.id = id
        self.volunteers = volunteers
    }
    
}
