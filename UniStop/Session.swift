//
//  Session.swift
//  UniStop
//
//  Created by Martin Lok on 04/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import Foundation

class Session: NSObject, NSCoding {

    // MARK: - Variabler og Konstanter
    
    let kDriversKey = "Drivers"
    let kStartTimeKey = "SessionStartTime"
    let kEndTimeKey = "SessionEndTime"
    let kNameKey = "Name"
    
    let startTime: NSDate!
    var endTime: NSDate?
    
    var drivers = [Int: Driver]()
	var numberOfDrivers: Int {
        get {
            return self.drivers.count
        }
    }
    
    // MARK: - Initializers

    override init() {
        startTime = NSDate()
        endTime = nil
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        drivers = aDecoder.decodeObjectForKey(kDriversKey) as! [Int: Driver]
        startTime = aDecoder.decodeObjectForKey(kStartTimeKey) as? NSDate
        endTime = aDecoder.decodeObjectForKey(kEndTimeKey) as? NSDate
        super.init()
    }
    
    // MARK: Coder
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(drivers, forKey: kDriversKey)
        aCoder.encodeObject(startTime, forKey: kStartTimeKey)
        aCoder.encodeObject(endTime, forKey: kEndTimeKey)
    }
    
    // MARK: - Functions
    
    
    func setEndTime() {
        endTime = NSDate()
    }
    
    func stopAllDrivers() {
        let driver1 = drivers[1]
        let driver2 = drivers[2]
        let driver3 = drivers[3]
        let driver4 = drivers[4]
        
        driver1?.stopTimer()
        driver2?.stopTimer()
        driver3?.stopTimer()
        driver4?.stopTimer()
    }
    
    // MARK: - Time Functions
    

    

}















