//
//  InterfaceController.swift
//  TimeEvents WatchKit Extension
//
//  Created by Manuel "StuFF mc" Carrasco Molina on 11/07/15.
//  Copyright © 2015 @stuffmc. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
  
    let session = WCSession.defaultSession()
    @IBOutlet var table: WKInterfaceTable!
  
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        session.delegate = self
        session.activateSession()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
      if let events = applicationContext["events"] as? [NSDate] {
        table.setNumberOfRows(events.count, withRowType: "Event")
        for index in 0..<events.count {
          if let trc = table.rowControllerAtIndex(index) as? TableRowController {
            trc.eventLabel.setText(events[index].description)
          }
        }
      }
    }

}

class TableRowController: NSObject {
  
  @IBOutlet var eventLabel: WKInterfaceLabel!
  
}