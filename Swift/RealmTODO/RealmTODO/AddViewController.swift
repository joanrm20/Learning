//
//  AddViewController.swift
//  RealmTODO
//
//  Created by First Factory on 2/25/15.
//  Copyright (c) 2015 joanrm20. All rights reserved.
//

import UIKit
import Realm

protocol AddViewControllerDelegate {
    func didFinishTypingText(typedText: String?)
}

class AddViewController: UIViewController, UITextFieldDelegate {
    var textField : UITextField?
    var newItemText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setupTextField()
        setupNavigationBar()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        textField?.becomeFirstResponder()
    }
    
    func setupTextField(){
        textField = UITextField(frame: CGRectZero)
        textField?.placeholder = "Type in item"
        textField?.delegate = self
        view.addSubview(textField!)
        
    }
    
    func setupNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneAction")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let padding = CGFloat(11)
        textField?.frame = CGRectMake(padding, self.topLayoutGuide.length + 50, view.frame.size.width - padding * 2, 100)
        
    }
    
    func doneAction(){
        let realm = RLMRealm.defaultRealm()
        if self.textField?.text.utf16Count > 0 {
            let newTodoItem = ToDoItem()
            newTodoItem.name = self.textField!.text
            realm.transactionWithBlock(){
                realm.addObject(newTodoItem)
            }
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        doneAction()
        textField.resignFirstResponder()
        return true
    }
    
    
}