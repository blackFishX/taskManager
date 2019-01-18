//
//  DbFunction.swift
//  TasksManager
//
//  Created by xerasy on 1/18/19.
//  Copyright © 2019 blackDevIos. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

enum RuntimeError: Error {
    case NoRealmSet
}

class DbFunction {
    var realm: Realm!
    
    
    
    func write(_ data: Task) throws -> Bool {
        var result = false
        
        if (realm != nil) {
            try! realm.write {
                realm.add(data)
                result = true
            }
            return result
        } else {
            throw RuntimeError.NoRealmSet
        }
        
    }
    
    func getArrayItem() -> Results<Task> {
        return realm.objects(Task.self)
    }
    
    func delete(_ data: Task) throws -> Bool {
        var result = false
        if (realm != nil) {
            try! self.realm.write {
                self.realm.delete(data)
                result = true
            }
             return result
        } else {
            throw RuntimeError.NoRealmSet
        }
       
    }
    
    func makeNewTask(_ name: String) -> Task {
        let task = Task()
        task.name = name
        return task
    }
    
}
