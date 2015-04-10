//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Jose on 4/3/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessTxt: UITextField!
    @IBOutlet weak var guessResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guessBtn(sender: AnyObject) {
        var randomNumber = arc4random_uniform(6)
        var guessInt = guessTxt.text.toInt()
        if guessInt != nil {
            if Int(randomNumber) == guessInt {
            
                guessResult.text = "Correct"
            }
            else{
                  guessResult.text = "Nope it was \(randomNumber)"
            }
            
        }
        else{
        guessResult.text = "Please enter a number between 0 to 5"
        
        }
        
        
    }

}

