//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Jose on 4/2/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textToRead: UITextView!
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSpeech(sender: UIButton) {
        myUtterance = AVSpeechUtterance(string: textToRead.text)
        myUtterance.rate = 0.1
        synth.speakUtterance(myUtterance)
        
    }

}

