//
//  TasksManagerTests.swift
//  TasksManagerTests
//
//  Created by xerasy on 1/17/19.
//  Copyright © 2019 blackDevIos. All rights reserved.
//

import XCTest
import RealmSwift
@testable import TasksManager
class TasksManagerTests: XCTestCase {

    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}