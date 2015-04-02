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
    
    //LogItem class is not tied to any specific NSManagedObjectContext, so we want to make sure we aren’t storing the reference to the managed object context anywhere in the model, it needs to be passed in when we want to create an object like this.
    class func createInManagedObjectContext(moc: NSManagedObjectContext, title: String, text: String) -> LogItem {
        
     let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: moc) as LogItem
        newItem.title = title
        newItem.itemText = text
      
      return newItem
    }

}
