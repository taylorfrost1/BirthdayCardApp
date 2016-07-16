//
//  ThirdViewController.swift
//  BirthdayCard
//
//  Created by Taylor Frost on 7/15/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var thirdBackgroundImageView: UIImageView!

    @IBOutlet weak var thirdSelfieImageView: UIImageView!
    
    var thirdReceivedSelfie : UIImage?
    
    var thirdReceivedBackground : UIImage?
    
    var backgroundPlayer:AVAudioPlayer?
    
    var pinchCharacter : FirstImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.thirdBackgroundImageView.image = self.thirdReceivedBackground
        
        self.thirdSelfieImageView.image = self.thirdReceivedSelfie
        
//        self.thirdSelfieImageView.contentMode = .ScaleAspectFit
        
        self.backgroundPlayer = self.getAudioPlayer("groovyhiphop", fileExt:
            "mp3")
        
        self.backgroundPlayer?.play()
        
  }
    
    func getAudioPlayer(filename: String, fileExt: String) -> AVAudioPlayer? {
        
        var audioPlayer : AVAudioPlayer?
        
        // Get a pointer to the reference of the file
        if let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileExt) {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: filePath)
                
                audioPlayer?.volume = 1.0
                audioPlayer?.prepareToPlay()
                
            } catch {
                
                print("An error occured")
                
            }
            
        } else {
            print("I cant find the file")
        }
        
        return audioPlayer
    }
    
   func thirdPinchFunc() {
        
        self.pinchCharacter = FirstImageView(image: UIImage(named:"6"))
        
        if let myChar = self.pinchCharacter {
            
            let width = self.view.frame.size.width / 2
            let height = self.view.frame.size.height / 2
            
            let randomX = CGFloat(arc4random_uniform(UInt32(width)))
            
            
            let randomY = CGFloat(arc4random_uniform(UInt32(height)))
            
            let newFrame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
            
            myChar.frame = newFrame
            
            self.view.addSubview(myChar)
        }
        
   }
    
    

}
