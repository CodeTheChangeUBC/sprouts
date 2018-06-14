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
    var currentRecord: VolunteerRecord!
    var records: [VolunteerRecord]!
    
    init(withName name: String, withID id: Int, havingWorkedThisTerm hoursWorkedThisTerm: Double, havingWorkedInTotal hoursWorkedTotal: Double) {
        self.name = name
        self.id = id
        currentRecord = nil
        records = [VolunteerRecord]()
    }
    
    mutating func startRecord(atEvent event: Event) {
        if currentRecord == nil {
            currentRecord = VolunteerRecord(forEvent: event.name)
        }
    }
    
    mutating func endRecord() {
        if currentRecord != nil {
            currentRecord.endSession()
            records.append(currentRecord)
            currentRecord = nil
        }
    }
    
}
