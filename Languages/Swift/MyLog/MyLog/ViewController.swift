//
//  ViewController.swift
//  MyLog
//
//  Created by First Factory on 2/17/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // Retreive the managedObjectContext from AppDelegate 
    // global , so we can have easy access
    //let managedObjectContext = (UIApplication.sharedApplication().delegate as,!AppDelegate);.managedObjectContext
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
       
     
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: self.managedObjectContext) as LogItem
           newItem.title = "Wrote Core Data Sample"
           newItem.itemText = "Wrote and post about core data basics"
        

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "LogItem")
        if let fetchResults = managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as? [LogItem]{
            // create and alert, and set it's message to whatever the itemText is
            let alert = UIAlertController(title: fetchResults[0].title, message: fetchResults[0].itemText, preferredStyle: .Alert)
        
            // display the alert
            self.presentViewController(alert, animated:true, completion: nil)
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

