//
//  Helper Functions.swift
//  UniStop
//
//  Created by Martin Lok on 17/03/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import Foundation



func stringFromTimeInterval(interval:NSTimeInterval) -> NSString {
    
    let ti = NSInteger(interval)
    
    let ms = Int((interval % 1) * 1000)
    let seconds = ti % 60
    let minutes = (ti / 60) % 60
    // let hours = (ti / 3600)
    
    return NSString(format: "%0.2d:%0.2d.%0.3d",minutes,seconds,ms)
}

func getStringFromDate(date: NSDate, withTime: Bool, withDate: Bool) -> String {
    let dateFormatter = NSDateFormatter()
    
    if withDate {
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateStyle = .ShortStyle
    } else if withTime {
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .NoStyle
    } else if withTime && withDate {
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .ShortStyle
    }
    
    let dateString = dateFormatter.stringFromDate(date)
    
    return dateString
}


func addNewDriver(driver: Driver, atIndex index: Int, inSession session: Session) {

    session.drivers[index] = driver
}





