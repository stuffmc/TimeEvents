//
//  ViewController.swift
//  TimeEvents
//
//  Created by Manuel "StuFF mc" Carrasco Molina on 11/07/15.
//  Copyright © 2015 @stuffmc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var events = [NSDate()]

  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
  }

}

