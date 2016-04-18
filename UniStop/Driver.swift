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
    
    // Test om det virker senere. Er ikke sikker
    var bestLap: Lap? {
        get {
            if let bestLap = getBestLap() {
                return bestLap
            } else {
                return nil
            }
        }
    }
    
    var totalLaps: Int {
        get {
            return laps.count
        }
    }
    
    var startDate: NSDate!
    var endDate: NSDate?
    
    var delegate: DriverDelegate?
    
    var timer: NSTimer = NSTimer()
    var timeDifference: NSTimeInterval = 0.0
    var timeDifferenceInt: Int = 0

    // MARK: - Initializers
    
    override init() {
        startDate = NSDate()
        endDate = nil
        super.init()
        if laps.isEmpty {
            addLap(Lap())
        }
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
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(Driver.updateAtFireTime), userInfo: nil, repeats: true)
	}
	
	func updateAtFireTime() {
        let currentDate = getCurrentDate()
        timeDifference = currentDate.timeIntervalSinceDate(startDate)
        
        timeDifferenceInt = Int(timeDifference * 100)
        laps.last!.lapTime = timeDifference

        if timeDifferenceInt % 5 == 0 {
            delegate?.driverShouldUpdateView(timeDifference)
        }
        
        if timeDifference >= 30 {
            timer.invalidate()
            delegate?.driverShouldUpdateView(timeDifference)
        }
	}
    
    func resetTimer() {
        startDate = NSDate()
        timeDifference = 0.0
    }
    
    // MARK: - Lap Functions
    
    func getBestLap() -> Lap? {
        
        let sortedLapTimes: [Lap]? = laps.sort({$0.lapTime < $1.lapTime})
        
        if let _ = sortedLapTimes {
            return sortedLapTimes!.first! as Lap!
        } else {
            return nil
        }
    }
    
    func addLap(lap: Lap) {
        laps.append(lap)
    }
    
    // MARK: - Helper Functions
    
    func getCurrentDate() -> NSDate {
        return NSDate()
    }
}





