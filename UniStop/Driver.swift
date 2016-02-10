//
//  Driver.swift
//  UniStop
//
//  Created by Martin Lok on 04/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import Foundation


class Driver: NSObject, NSCoding {
    
    // MARK: - Variabler og Konstanter
    
    let kLapsKey = "Laps"
    let kStartTimeKey = "DriverStartTime"
    let kEndTime = "DriverEndtTime"
    
    var laps = [Lap]()
    
    var bestLap: Lap?
    var totalLaps: Int {
        get {
            return laps.count
        }
    }
    
    let startTime: NSDate!
    var endTime: NSDate?

    // MARK: - Initializers
    
    override init() {
        bestLap = nil
        startTime = NSDate()
        endTime = nil
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        laps = aDecoder.decodeObjectForKey(kLapsKey) as! [Lap]
        startTime = aDecoder.decodeObjectForKey(kStartTimeKey) as! NSDate
        endTime = aDecoder.decodeObjectForKey(kEndTime) as? NSDate
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(laps, forKey: kLapsKey)
        aCoder.encodeObject(startTime, forKey: kStartTimeKey)
        aCoder.encodeObject(endTime, forKey: kEndTime)
    }
    
}





