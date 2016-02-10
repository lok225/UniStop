//
//  StopWatchViewController.swift
//  UniStop
//
//  Created by Martin Lok on 04/02/2016.
//  Copyright © 2016 Martin Lok. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    // MARK: - Variabler og Konstanter

    var dataModel: DataModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = Session()
        let driver = Driver()
        let lap = Lap()
        let split = Split()

        lap.splits.append(split)
        driver.laps.append(lap)
        session.drivers.append(driver)
        dataModel.sessions.append(session)
        
        dataModel.saveSessions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
