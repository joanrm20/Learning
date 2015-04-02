//
//  ViewController.swift
//  RealmTODO
//
//  Created by First Factory on 2/24/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit
import Realm

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addButtonAction")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        // Every time you visit the ViewController, you want to see the latest data. That is why you have to reload the table view each time.
    }
    
    override func tableView(tableView: (UITableView!), numberOfRowsInSection section: Int) -> Int {
        return Int(todos.count)
        // Next up, the table view needs to know how many items it should display. Access your todos variable and return its count.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        let index = UInt(indexPath.row)
        let todoItem = todos.objectAtIndex(index) as ToDoItem
        // Dequeue your registered cell, get the index of the current cell and fetch the corresponding object from your database.

        cell.textLabel?.text = todoItem.name
        // Set the name of your fetched ToDoItem to the cell’s textLabel.
        return cell
        
    }
    
    func addButtonAction() {
        let addViewController = AddViewController(nibName: nil, bundle: nil)
        //addViewController.delegate = self
        let navController = UINavigationController(rootViewController: addViewController)
        presentViewController(navController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var todos: RLMResults {
        get {
            return ToDoItem.allObjects()
        }
    }


}

