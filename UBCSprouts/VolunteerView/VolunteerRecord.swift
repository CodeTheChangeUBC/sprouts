//
//  VolunteerRecord.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-01.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import Foundation

struct VolunteerRecord {
    
    var eventName: String!
    var startDate: Date!
    var endDate: Date!
    var totalMinutes: Int!
    var checkedOut: Bool!
    
    init(forEvent eventName: String) {
        self.eventName = eventName
        startDate = Date()
        endDate = Date()
        totalMinutes = -1
        checkedOut = false
    }
    
    mutating func endSession() {
        if (!checkedOut) {
            endDate = Date()
            totalMinutes = Calendar.current.dateComponents([.minute], from: startDate, to: endDate).minute ?? 0
            checkedOut = true
        }
    }
    
}
