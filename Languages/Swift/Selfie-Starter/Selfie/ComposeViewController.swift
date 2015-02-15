//
//  ComposeViewController.swift
//  Selfie
//
//  Created by Subhransu Behera on 12/10/14.
//  Copyright (c) 2014 subhb.org. All rights reserved.
//

import UIKit

protocol SelfieComposeDelegate {
  func reloadCollectionViewWithSelfie(selfieImgObject: SelfieImage)
}

class ComposeViewController: UIViewController {
  @IBOutlet weak var thumbImgView: UIImageView!
  @IBOutlet weak var titleTextView: UITextView!
  @IBOutlet weak var activityIndicatorView: UIView!
  
  var thumbImg : UIImage!
  var composeDelegate:SelfieComposeDelegate! = nil
  let httpHelper = HTTPHelper()
  
  override func viewDidLoad() {
    super.viewDidLoad()    
  }
  
  func setNavigationItems() {
    self.title = "Compose"
    
    var cancelBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("cancelBtnTapped"))
    self.navigationItem.leftBarButtonItem = cancelBarButtonItem
    
    var postBarButtonItem = UIBarButtonItem(title: "Post", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("postBtnTapped"))
    self.navigationItem.rightBarButtonItem = postBarButtonItem
  }
  
  func cancelBtnTapped() {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func displayAlertMessage(alertTitle:NSString, alertDescription:NSString) -> Void {
    // hide activityIndicator view and display alert message
    self.activityIndicatorView.hidden = true
    let errorAlert = UIAlertView(title:alertTitle, message:alertDescription, delegate:nil, cancelButtonTitle:"OK")
    errorAlert.show()
  }
  
  func postBtnTapped() {
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
