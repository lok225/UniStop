//
//  DataModel.swift
//  UniStop
//
//  Created by Martin Lok on 04/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import Foundation


class DataModel: NSObject {
    
    // MARK: - Variabler og Konstanter
    
    let kSessionskey = "Session"
    
    var sessions = [Session]()
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        loadSessions()
    }
    
    // MARK: - DataModel Saving & Loading
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        print(paths[0])
        return paths[0]
    }
    
    func dataFilePath() -> String {
        
        // /Users/martinlok/Library/Developer/CoreSimulator/Devices/FB8861E1-51F8-4A31-8346-10205C50C197/data/Containers/Containers/Data/Application/442C6CF5-840A-437E-8911-2B8D451F413C/Documents
        
        return (documentsDirectory() as NSString).stringByAppendingPathComponent("UniStop.plist")
    }
    
    func saveSessions() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(sessions, forKey: kSessionskey)
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
        
        print("saved")
    }
    
    func loadSessions() {
        let path = dataFilePath()
        
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                sessions = unarchiver.decodeObjectForKey(kSessionskey) as! [Session]
                
                unarchiver.finishDecoding()
            }
        }
        
    }

    
}