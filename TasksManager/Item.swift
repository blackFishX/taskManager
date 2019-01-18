//
//  Item.swift
//  TasksManager
//
//  Created by xerasy on 1/17/19.
//  Copyright © 2019 blackDevIos. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture = "todo"
}
