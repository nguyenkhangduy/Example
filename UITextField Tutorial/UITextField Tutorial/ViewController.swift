//
//  ViewController.swift
//  UITextField Tutorial
//
//  Created by synclapn1181 on 11/05/15.
//  Copyright (c) 2015 sourcefreeze. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate

{

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var enteredValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(sender: AnyObject) {
        textField.resignFirstResponder();
        enteredValue.text = textField.text;
    }

// UITextField Delegates
    func textFieldDidBeginEditing(textField: UITextField) {
        println("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(textField: UITextField) {
        println("TextField did end editing method called")
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        println("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(textField: UITextField) -> Bool {
        println("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("TextField should snd editing method called")
        return true;
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        println("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    

}

