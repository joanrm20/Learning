//
//  LogItem.swift
//  MyLog
//
//  Created by First Factory on 2/18/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import Foundation
import CoreData

class LogItem: NSManagedObject {

    @NSManaged var itemText: String
    @NSManaged var title: String

}
