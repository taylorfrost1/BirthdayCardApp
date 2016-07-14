//
//  ViewController.swift
//  BirthdayCard
//
//  Created by Taylor Frost on 7/14/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pickedImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    @IBAction func buttonOneTapped(sender: UIButton) {
        
        self.pickedImage = UIImage(named: "blueBackground")
        
        performSegueWithIdentifier("Segue1", sender: self)
        
   }
    
    @IBAction func ButtonTwoTapped(sender: UIButton) {
        
        self.pickedImage = UIImage(named: "redBackground")
        
        performSegueWithIdentifier("Segue1", sender: self)
        
    }
    
    @IBAction func buttonThreeTapped(sender: UIButton) {
        
        self.pickedImage = UIImage(named: "greenBackground")
        
        performSegueWithIdentifier("Segue1", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as? SecondViewController
        
        controller?.recievedImage = self.pickedImage
        
    }
    
}

