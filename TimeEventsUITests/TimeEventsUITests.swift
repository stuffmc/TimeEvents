//
//  TimeEventsUITests.swift
//  TimeEventsUITests
//
//  Created by Manuel "StuFF mc" Carrasco Molina on 11/07/15.
//  Copyright © 2015 @stuffmc. All rights reserved.
//

import XCTest

class TimeEventsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      
      
      let addTimestampButton = XCUIApplication().buttons["Add Timestamp"]
      addTimestampButton.tap()
      addTimestampButton.tap()
      addTimestampButton.tap()
      
    }
    
}
