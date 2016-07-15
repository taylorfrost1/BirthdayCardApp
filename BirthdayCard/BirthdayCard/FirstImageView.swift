//
//  FirstImageView.swift
//  BirthdayCard
//
//  Created by Taylor Frost on 7/15/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import QuartzCore

class FirstImageView: UIImageView, UIGestureRecognizerDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.initialize()
    }
    
    func initialize() {
        
        // Important for allow user interaction on images
        
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        self.exclusiveTouch = true
        
        
        // Aspect Fit the Image
        self.contentMode = .ScaleAspectFit
        
        // Important: One gesture recognizer type is required to monitor this UIImageView
        
        // 1. Add the Tap Gesture
        
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(handleTap(_:)))
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
        
        // 2. Add the Pan Gesture
        
        let panGesture = UIPanGestureRecognizer(target: self, action:#selector(handlePan(_:)))
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)
        
        // 3. Add the Pinch Gesture
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(handlePinch(_:)))
        pinchGesture.delegate = self
        self.addGestureRecognizer(pinchGesture)
        
        // 4. Add the Rotate Gesture
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action:#selector(handleRotate(_:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }
    
    // Mark - Gesture Methods
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view {
            view.superview!.bringSubviewToFront(self)
        }
    }
    
    func handlePan(recognizer:UIPanGestureRecognizer) {
        
        let translation = recognizer.translationInView(recognizer.view)
        
        if let view = recognizer.view {
            view.transform = CGAffineTransformTranslate(view.transform, translation.x, translation.y)
        }
        
        recognizer.setTranslation(CGPointZero, inView: self)
    }
    
    func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformScale(view.transform, recognizer.scale, recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    func handleRotate(recognizer : UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    // Needed to allow multiple touches (i.e. zoom and pinch)
    func gestureRecognizer(_: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
        return true
    }

}
