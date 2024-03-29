//
//  ViewController.swift
//  MyLog
//
//  Created by First Factory on 2/17/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    // Retreive the managedObjectContext from AppDelegate
    //managedObjectContext is a lazy variable on AppDelegate that is at our 
    //disposable for use in performing Core Data callsglobal , so we can have easy access
    
   let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    // Create the table view as soon as this class loads
    var logTableView = UITableView(frame: CGRectZero, style: .Plain)
    
    //Create an empty array of LogItem's
    var logItems = [LogItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let moc = self.managedObjectContext {
            //create dummy data to work with
            var items = [
                ("Best Animal", "Dog"),
                ("Best Language","Swift"),
                ("Worst Animal","Cthulu"),
                ("Worst Language","LOLCODE")
            ]
            
            // Loop through, creating items
            for (itemTitle, itemText) in items {
                // Create an individual item
                LogItem.createInManagedObjectContext(moc,
                    title: itemTitle, text: itemText)
            }
            
          
            // Now that the view loaded, we have a frame for the view, which will be (0,0,screen width, screen height)
            // This is a good size for the table view as well, so let's use that
            // The only adjust we'll make is to move it down by 20 pixels, and reduce the size by 20 pixels
            // in order to account for the status bar
            
            // Store the full frame in a temporary variable
            var viewFrame = self.view.frame;
            
            //Adjust it down by 20 points
            viewFrame.origin.y  += 20
            
            
            //Reduce the totla height by 20 points
            viewFrame.size.height -= 20
            
            //Set the logTableViews frame to equal our temporary variable with the full size of the view/
            // adjusted to account dor the status bar height
            logTableView.frame = viewFrame
            
            //Add the table view to this view controller's view
            self.view.addSubview(logTableView)
            
            //Here, we tell the table view that we intend to use a cell we're going to call "LogCell"
            //This will be associated with the standard UITableViewCell class for now
            
            logTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "LogCell")
            
           
            // This tells the table view that it should get it's data from this class, ViewController
            logTableView.dataSource = self
            logTableView.delegate = self
            
           
            
        }
         fetchLog()
        

    }
    func fetchLog(){
        let fetchRequest = NSFetchRequest(entityName: "LogItem")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [LogItem] {
            logItems = fetchResults
        }
    }
    
      // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //How many rows are there in this section?
        //There's only 1 section, and it has a number of rows
        // equal to the number of logItems, so return the count
        
        return logItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LogCell") as UITableViewCell
        
        //Get the LogItem for the index
        let logItem = logItems[indexPath.row]
        
        //set the title of the cell to be the title of the logItem
        cell.textLabel?.text = logItem.title
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let logItem = logItems[indexPath.row]
        println(logItem.itemText)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

