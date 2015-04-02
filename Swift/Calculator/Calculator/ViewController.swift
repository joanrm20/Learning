//
//  ViewController.swift
//  Calculator
//
//  Created by Jose Andres Ramirez Mora on 2/18/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var uiitmot: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if  uiitmot {
            display.text = display.text! + digit
            
        }
        else{
            uiitmot=true
            display.text = digit
            
        }
        
    }
    
    
    @IBAction func enter() {
        uiitmot = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


