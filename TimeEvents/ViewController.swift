//
//  ViewController.swift
//  TimeEvents
//
//  Created by Manuel "StuFF mc" Carrasco Molina on 11/07/15.
//  Copyright © 2015 @stuffmc. All rights reserved.
//

import UIKit
import WatchConnectivity

extension WCSession {
  var allGood: Bool { get {
    return paired == true && watchAppInstalled == true && watchDirectoryURL != nil
  } }
}

class ViewController: UIViewController, WCSessionDelegate {
  
  let session = WCSession.defaultSession()
  var events = [NSDate()]

  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(WCErrorCode.NotReachable)
    if WCSession.isSupported() {
      session.delegate = self
      session.activateSession()
    }
    refresh()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func add(sender: UIButton) {
    events.append(NSDate())
    refresh()
  }
  
  func refresh() {
    textView.text = events.description.stringByReplacingOccurrencesOfString(",", withString: "\n")
    do {
      try session.updateApplicationContext(["events" : events])
    } catch {
      print(error)
    }
  }
  
  func output(string: AnyObject) {
    dispatch_sync(dispatch_get_main_queue()) { () -> Void in
      self.textView.text = "\(self.textView.text)\n \(string)"
    }
  }
  
  func sessionWatchStateDidChange(session: WCSession) {
    output(session.paired)
    output(session.watchAppInstalled)
    output(session.watchDirectoryURL ?? "no watch dir")
    if session.allGood {
      try! session.updateApplicationContext(["events" : events])
      output("CONTEXT: \(session.applicationContext)")
    }
  }

}

