//
//  ViewController.swift
//  Cat Years
//
//  Created by First Factory on 2/13/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var result: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func findAge(sender: AnyObject) {
        result.hidden = false
        var enteredAge = age.text.toInt()
        
        if enteredAge != nil{
            var catYears = enteredAge! * 7
            
            result.text = "Your Cat is \(catYears) in cat years"
        }
        else {
            result.text = "Please enter a number in the box"
        }
       
    }
    
 


}

