//
//  SecondViewController.swift
//  BirthdayCard
//
//  Created by Taylor Frost on 7/14/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.


import UIKit

class SecondViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var pinchCharacter : FirstImageView?
    
    let imagePicker = UIImagePickerController()
    
    var recievedImage : UIImage?
    
    var selfie : UIImage?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self

        
    }
    
    @IBAction func chooseImage(sender: UIBarButtonItem) {
        
        if  UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            imagePicker.sourceType = .Camera
            
        } else {
            // Camera Not Available
            self.imagePicker.sourceType = .PhotoLibrary
        }
        
        self.imagePicker.allowsEditing = true
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // Notice: UIImagePickerControllerEditedImage rather than UIImagePickerControllerOrginalImage
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            self.backgroundImageView.contentMode = .ScaleAspectFit
            self.backgroundImageView.image = pickedImage
            self.selfie = pickedImage
            
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as? ThirdViewController
        
        controller?.thirdReceivedSelfie = self.selfie
        controller?.thirdReceivedBackground = self.recievedImage
        
        print("selfie and background are being passed")
    
    }

    @IBAction func button1(sender: UIButton) {
        
        performSegueWithIdentifier("Segue2", sender: self)
        
    }
    

}
