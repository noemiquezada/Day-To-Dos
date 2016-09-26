//
//  Day_To_DosTests.swift
//  Day To DosTests
//
//  Created by Noemi Quezada on 9/21/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//

import XCTest
@testable import Day_To_Dos

class Day_To_DosTests: XCTestCase {
    
    let data = DataSource()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddTask() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // TC 1
        print("TC 1: Invalid Task")
        data.retrievalDate = "09-23-16"
        data.add(task: "")
        XCTAssertEqual(data.taskCount(), 0)
        
        // TC 2
        print ("TC 2: Invalid Date")
        data.retrievalDate = "09-32-16"
        data.add(task: "Apples")
        XCTAssertEqual(data.taskCount(), 0)
        
        // TC 3
        print( "TC 3: Valid Date & Task")
        data.retrievalDate = "09-22-16"
        data.add(task: "Computers")
        XCTAssertEqual(data.taskCount(), 1)
        
        
    }
    
    func testRetrieveTaskTC1() {
        
        // TC 1
        print ("TC 1: Valid index and date")
        data.retrievalDate = "2016-09-24"
        data.add(task: "Bananas")
        data.add(task: "Apples")
        data.add(task: "Grapes")
        data.add(task: "Blueberries")
        let task = data.taskAtIndex(index: 3)
        XCTAssertEqual(task.name, "Blueberries")
        
    }
    
    func testRetrieveTaskTC2() {
        // TC 2
        print ("TC 2: Invalid index and valid date")
        data.retrievalDate = "2016-09-24"
        XCTAssertNil(data.taskAtIndex(index: -1))
    }
    
    func testRetrieveTaskTC3() {
        // TC 3
        print ("TC 3: Invalid date amd index")
        data.retrievalDate = ""
        XCTAssertNil(data.taskAtIndex(index: 2))
        
    }
    
    func testRetrieveTaskTC4() {
        // TC 4
        print (" TC 4: Invalid index")
        data.retrievalDate = "2016-09-24"
        XCTAssertNil(data.taskAtIndex(index: 999))
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
