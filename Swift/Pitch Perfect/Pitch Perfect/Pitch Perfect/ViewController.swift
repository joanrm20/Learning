//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Jose Andres Ramirez Mora on 11/25/14.
//  Copyright (c) 2014 J.R apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        recordingLbl.hidden = false
    }
    @IBAction func stopRecording(sender: UIButton) {
        recordingLbl.hidden = true
    }

}

