//
//  StopWatchViewController.swift
//  UniStop
//
//  Created by Martin Lok on 04/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController, DriverDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var lblTimerLabel1: UILabel!
    @IBOutlet weak var lblTimerLabel2: UILabel!
    @IBOutlet weak var lblTimerLabel3: UILabel!
    @IBOutlet weak var lblTimerLabel4: UILabel!
    
    // MARK: - Variabler og Konstanter

    var dataModel: DataModel!
    var currentSession: Session! {
        didSet {
            resetDrivers()
            resetDriverLabels()
        }
    }

    var driver1: Driver?
    var driver2: Driver?
    var driver3: Driver?
    var driver4: Driver?
    
    // MARK: - Initial Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Sessions: \(dataModel.sessions.count)")
        print("Drivers: \(dataModel.sessions.last!.drivers.count)")
        print("Laps: \(dataModel.sessions[0].drivers[1]?.laps.count)")
        print("Laptime: \(dataModel.sessions[0].drivers[1]?.laps[0].lapTime)")
        
        currentSession = dataModel.sessions.last
        
        let lapTime = currentSession.drivers[1]?.laps[0].lapTime
        let lapTime2 = currentSession.drivers[2]?.laps[0].lapTime
        let lapTime3 = currentSession.drivers[3]?.laps[0].lapTime
        let lapTime4 = currentSession.drivers[4]?.laps[0].lapTime


        if let _ = lapTime {
            lblTimerLabel1.text = "\(stringFromTimeInterval(lapTime!))"
        }
        if let _ = lapTime2 {
            lblTimerLabel2.text = "\(stringFromTimeInterval(lapTime2!))"
        }
        if let _ = lapTime3 {
            lblTimerLabel3.text = "\(stringFromTimeInterval(lapTime3!))"
        }
        if let _ = lapTime4 {
            lblTimerLabel4.text = "\(stringFromTimeInterval(lapTime4!))"
        }

    }
    
    // MARK: - DriverDelegate
    
    func driverShouldUpdateView(time: NSTimeInterval) {
        
        if let _ = driver1 {
            let lap = driver1!.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)
            lblTimerLabel1.text = timeString as String
        }
  
        if let _ = driver2 {
            let lap = driver2!.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)
            lblTimerLabel2.text = timeString as String
        }
        
        if let _ = driver3 {
            let lap = driver3!.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)
            lblTimerLabel3.text = timeString as String
        }
        
        if let _ = driver4 {
            let lap = driver4!.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)
            lblTimerLabel4.text = timeString as String
        }

    }
    
    // MARK: - IBActions
    
    @IBAction func startDriver1(sender: UIButton) {
        if let driver = driver1 {
            driver.stopTimer()
        }
        driver1 = Driver()
        driver1!.fireTimer()
        driver1!.delegate = self
        addNewDriver(driver1!, atIndex: 1, inSession: currentSession)
    }
    
    @IBAction func startDriver2(sender: UIButton) {
        if let driver = driver2 {
            driver.stopTimer()
        }
        driver2 = Driver()
        driver2!.fireTimer()
        driver2?.delegate = self
        addNewDriver(driver2!, atIndex: 2, inSession: currentSession)
    }
    
    @IBAction func startDriver3(sender: UIButton) {
        if let driver = driver3 {
            driver.stopTimer()
        }
        driver3 = Driver()
        driver3!.fireTimer()
        driver3?.delegate = self
        addNewDriver(driver3!, atIndex: 3, inSession: currentSession)
    }
    
    @IBAction func startDriver4(sender: UIButton) {
        if let driver = driver4 {
            driver.stopTimer()
        }
        driver4 = Driver()
        driver4!.fireTimer()
        driver4?.delegate = self
        addNewDriver(driver4!, atIndex: 4, inSession: currentSession)
    }
    
    @IBAction func newSession(sender: UIButton) {
        currentSession.stopAllDrivers()
        dataModel.saveSessions()
        dataModel.newSession()
        dataModel.saveSessions()
        currentSession = dataModel.sessions.last!
    }
    
    // MARK: - New Session Functions
    
    func resetDrivers() {
        driver1 = nil
        driver2 = nil
        driver3 = nil
        driver4 = nil
    }
    
    func resetDriverLabels() {
        lblTimerLabel1.text = "1"
        lblTimerLabel2.text = "2"
        lblTimerLabel3.text = "3"
        lblTimerLabel4.text = "4"
    }
    
}




























