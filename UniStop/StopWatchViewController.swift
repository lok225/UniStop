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
    
    @IBOutlet weak var lblBestLap1: UILabel!
    @IBOutlet weak var lblBestLap2: UILabel!
    @IBOutlet weak var lblBestLap3: UILabel!
    @IBOutlet weak var lblBestLap4: UILabel!
    
    // MARK: - Variabler og Konstanter

    var dataModel: DataModel!
    var currentSession: Session! {
        didSet {
            resetDrivers()
            updateDriverLabels()
        }
    }

    var driver1: Driver?
    var driver2: Driver?
    var driver3: Driver?
    var driver4: Driver?
    
    let kNoDriverString: String = "Lap 1 - Time:"
    
    // MARK: - Initial Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Opsætning af Session - Vigtigt!
        currentSession = dataModel.sessions.last
        
        // Forbind driverne fra nuværende session og opdater views
        driver1 = currentSession.drivers[1]
        driver2 = currentSession.drivers[2]
        driver3 = currentSession.drivers[3]
        driver4 = currentSession.drivers[4]
        updateDriverLabels()

        // TODO - Delegate call bliver ikke ved tryk på allerede brugt driver
        
    }
    
    // MARK: - DriverDelegate
    
    func driverShouldUpdateView(time: NSTimeInterval) {
        
        updateDriverLabels()
    }
    
    // MARK: - IBActions
    
    @IBAction func startDriver1(sender: UIButton) {
        setupDriver(driver1, atIndex: 1)
    }
    
    @IBAction func startDriver2(sender: UIButton) {
        setupDriver(driver2, atIndex: 2)
    }
    
    @IBAction func startDriver3(sender: UIButton) {
        setupDriver(driver3, atIndex: 3)
    }
    
    @IBAction func startDriver4(sender: UIButton) {
        setupDriver(driver4, atIndex: 4)
    }
    
    @IBAction func newSession(sender: UIButton) {
        currentSession.stopAllDrivers()
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
    
    // MARK: - Update Views
    
    func updateDriverLabels() {
        
        if let driver = driver1 {
            let lap = driver.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)!
            lblTimerLabel1.text = "Lap \(driver.laps.count) - \(timeString)"
        } else {
            lblTimerLabel1.text = kNoDriverString
        }
        
        if let driver = driver2 {
            let lap = driver.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)!
            lblTimerLabel2.text = "Lap \(driver.laps.count) - \(timeString)"
        } else {
            lblTimerLabel2.text = kNoDriverString
        }
        
        if let driver = driver3 {
            let lap = driver.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)!
            lblTimerLabel3.text = "Lap \(driver.laps.count) - \(timeString)"
        } else {
            lblTimerLabel3.text = kNoDriverString
        }
        
        if let driver = driver4 {
            let lap = driver.laps.last!
            let timeString = stringFromTimeInterval(lap.lapTime)!
            lblTimerLabel4.text = "Lap \(driver.laps.count) - \(timeString)"
        } else {
            lblTimerLabel4.text = kNoDriverString
        }
        
    }
    
    // MARK: - Driver functions
    
    func setupDriver(driver: Driver?, atIndex index: Int) {
        
        var driver: Driver? = nil
        switch index {
        case 1:
            driver = driver1
        case 2:
            driver = driver2
        case 3:
            driver = driver3
        case 4:
            driver = driver4
        default:
            break
        }
        
        // Hvis driver er nil, bliver der ikke forbundet en rigtig driver = "else" bliver aldrig called

        if let _ = driver {
            driver!.delegate = self
            driver!.resetTimer()
            driver!.addLap(Lap())
        } else {
//            driver = Driver()
//            driver!.delegate = self
//            addNewDriver(driver!, atIndex: index, inSession: currentSession)
            
            // Midlertidig løsning
            switch index {
            case 1:
                driver1 = Driver()
                driver1!.delegate = self
                driver1!.fireTimer()
                addNewDriver(driver1!, atIndex: index, inSession: currentSession)
            case 2:
                driver2 = Driver()
                driver2!.delegate = self
                driver2!.fireTimer()
                addNewDriver(driver2!, atIndex: index, inSession: currentSession)
            case 3:
                driver3 = Driver()
                driver3!.delegate = self
                driver3!.fireTimer()
                addNewDriver(driver3!, atIndex: index, inSession: currentSession)
            case 4:
                driver4 = Driver()
                driver4!.delegate = self
                driver4!.fireTimer()
                addNewDriver(driver4!, atIndex: index, inSession: currentSession)
            default:
                break
            }
        }
        driver?.fireTimer()
    }
}




























