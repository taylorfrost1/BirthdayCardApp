//
//  ViewController.swift
//  AttorneyCalc
//
//  Created by Taylor Frost on 7/17/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.hidden = true
    }
    
    
    @IBAction func CalcButton(sender: UIButton) {
       
        myLabel.hidden = false
        let firstValue = Double(firstField.text!)
        let secondValue = Double(secondField.text!)
        
        if firstValue !=  nil &&  secondValue != nil {
        let outletValue = Double(firstValue! + secondValue!)
        myLabel.text = "The Answer is \(outletValue)"
    
        } else {
            
            myLabel.text = "Hey, enter a number buddy"
        }
    }

}

