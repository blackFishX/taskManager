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

    var dbFunction: DbFunction = DbFunction()
    
    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name

        let realm = try! Realm()
        dbFunction.realm = realm
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

    
    func testSaveAndGetTask() {
        do {
            let task = self.dbFunction.makeNewTask("TEST")
            
            try dbFunction.write(task)
            let arrayTask = dbFunction.getArrayItem()
            XCTAssertEqual(arrayTask.count, 1)
            
            let task1 = arrayTask.first
            XCTAssertEqual(task1?.name, "TEST")
            
        } catch RuntimeError.NoRealmSet {
            XCTAssert(false, "No realm database was set")
        } catch {
            XCTAssert(false, "Unexpected error \(error)")
        }
    }
    
    func testDeleteTask() {
        do {
            let task = self.dbFunction.makeNewTask("TEST")
            
            try dbFunction.write(task)
            try dbFunction.delete(task)
            
            let arrayTask = dbFunction.getArrayItem()
            XCTAssertEqual(arrayTask.count, 0)

            
        } catch RuntimeError.NoRealmSet {
            XCTAssert(false, "No realm database was set")
        } catch {
            XCTAssert(false, "Unexpected error \(error)")
        }
    }
}
