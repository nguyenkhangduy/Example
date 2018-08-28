//
//  ViewController.swift
//  ToDoList
//
//  Created by Duy, Nguyen Khang on 7/31/18.
//  Copyright © 2018 Duy, Nguyen Khang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var list: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        text.delegate =  self
    }
    
    @IBAction func add(_ sender: Any) {
        if let text = text.text {
            list.text.append(text)
            list.text.append("\n")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        if let text = text.text {
            list.text.append(text)
            list.text.append("\n")
        }
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

