//
//  ToDoItem.swift
//  RealmTODO
//
//  Created by First Factory on 2/24/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import Realm // import Realm


class ToDoItem: RLMObject { // inherit from Realm
    // Every property that should be fetched and stored in the database also needs the dynamic keyword. Also, set the default values for the properties.
    dynamic var name = ""
    dynamic var finished = false
}