//
//  Split.swift
//  UniStop
//
//  Created by Martin Lok on 05/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import Foundation


class Split: NSObject, NSCoding {
    
    var splitTime = 0
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
    }
    
}