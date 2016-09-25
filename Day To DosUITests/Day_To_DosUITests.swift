//
//  Day_To_DosUITests.swift
//  Day To DosUITests
//
//  Created by Noemi Quezada on 9/21/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import XCTest

class Day_To_DosUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCase() {
        
        // TC 1
        print("TC 1")
        let app = XCUIApplication()
        XCTAssert(app.staticTexts["Date Picker"].exists)
        
        let datePickersQuery = app.datePickers
        
        // TC 2
        print ("TC 2")
        datePickersQuery.pickerWheels["2016"].adjust(toPickerWheelValue: "2015")
        
        // TC 3
        print ("TC 3")
        datePickersQuery.pickerWheels["September"].adjust(toPickerWheelValue: "August")
        
        // TC 4
        print("TC 4")
        datePickersQuery.pickerWheels["25"].adjust(toPickerWheelValue: "26")
        
        // TC 5
        print("TC 5")
        app.navigationBars["Date Picker"].buttons["Refresh"].tap()
        let navigationBar = app.navigationBars["2015-08-26"]
        
        // TC 6
        print("TC 6")
        let addButton = navigationBar.buttons["Add"]
        addButton.tap()
        let newTaskAlert = app.alerts["New Task"]
        newTaskAlert.buttons["Add"].tap()
        
        // TC 8
        print ("TC 8")
        addButton.tap()
        newTaskAlert.buttons["Add"].tap()

        // TC 9
        print("TC 9")
        addButton.tap()
        newTaskAlert.buttons["Cancel"].tap()
        
        // TC 7
        print("TC 7")
        navigationBar.buttons["Date Picker"].tap()

        
    }
    
}
