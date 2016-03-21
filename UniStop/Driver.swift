//
//  Driver.swift
//  UniStop
//
//  Created by Martin Lok on 04/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import Foundation

protocol DriverDelegate: class {
    func driverShouldUpdateView(time: NSTimeInterval)
}

class Driver: NSObject, NSCoding {
    
    // MARK: - Variabler og Konstanter
    
    let kLapsKey = "Laps"
    let kStartDateKey = "DriverStartDate"
    let kEndDateKey = "DriverEndDate"
    
    var laps = [Lap]()
    var bestLap: Lap?
    var totalLaps: Int {
        get {
            return laps.count
        }
    }
    
    let startDate: NSDate!
    var endDate: NSDate?
    
    var delegate: DriverDelegate?
    
    var timer: NSTimer = NSTimer()

    // MARK: - Initializers
    
    override init() {
        bestLap = nil
        startDate = NSDate()
        endDate = nil
        super.init()
        laps.append(Lap())
    }
    
    required init?(coder aDecoder: NSCoder) {
        laps = aDecoder.decodeObjectForKey(kLapsKey) as! [Lap]
        startDate = aDecoder.decodeObjectForKey(kStartDateKey) as! NSDate
        endDate = aDecoder.decodeObjectForKey(kEndDateKey) as? NSDate
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(laps, forKey: kLapsKey)
        aCoder.encodeObject(startDate, forKey: kStartDateKey)
        aCoder.encodeObject(endDate, forKey: kEndDateKey)
    }
    
//    deinit {
//        timer.invalidate()
//        print("Invalidated")
//    }
    
    // MARK: - Timers
    

	func fireTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateAtFireTime"), userInfo: nil, repeats: true)
	}
	
	func updateAtFireTime() {
        let currentDate = getCurrentDate()
		let timeDifference: NSTimeInterval = currentDate.timeIntervalSinceDate(startDate)
//        print(timeDifference)
        
        let timeDifferenceInt = Int(timeDifference * 100)
        laps.last?.lapTime = timeDifference

        if timeDifferenceInt % 3 == 0 {
//            print("Called")
            delegate?.driverShouldUpdateView(timeDifference)
        }
        
        if timeDifference >= 30 {
            timer.invalidate()
            delegate?.driverShouldUpdateView(timeDifference)
        }
	}
    
    func stopTimer() {
        timer.invalidate()
        print("Stopped")
    }
    
    func getCurrentDate() -> NSDate {
    	return NSDate()
    }
    
}





