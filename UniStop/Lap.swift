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
    
    var splits = [Split]()
    
    var lapTime = 0
    
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        splits = aDecoder.decodeObjectForKey(kSplitsKey) as! [Split]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(splits, forKey: kSplitsKey)
    }
    
}