//
//  SecondViewController.swift
//  BirthdayCard
//
//  Created by Taylor Frost on 7/14/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var recievedImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImageView.image = self.recievedImage
        
    }

}
