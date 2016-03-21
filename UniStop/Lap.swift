//
//  Lap.swift
//  UniStop
//
//  Created by Martin Lok on 05/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import Foundation


class Lap: NSObject, NSCoding {
    
    let kSplitsKey = "Splits"
    let kLapStartDateKey = "LapStartDate"
    let kLapTimeKey = "LapTime"
    
    var splits = [Split]()
    
    var lapTime: NSTimeInterval = 0.0
    var startDate: NSDate!
    
    override init() {
        startDate = NSDate()
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        splits = aDecoder.decodeObjectForKey(kSplitsKey) as! [Split]
        startDate = aDecoder.decodeObjectForKey(kLapStartDateKey) as! NSDate
        lapTime = aDecoder.decodeObjectForKey(kLapTimeKey) as! NSTimeInterval
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(splits, forKey: kSplitsKey)
        aCoder.encodeObject(startDate, forKey: kLapStartDateKey)
        aCoder.encodeObject(lapTime, forKey: kLapTimeKey)
    }
    
}