//
//  GestureViewController.swift
//  Animations and Gestures
//
//  Created by Corwin Crownover on 2/17/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {

   // OUTLETS
    @IBOutlet weak var mrCleanImageView: UIView!
    @IBOutlet weak var totoroImageView: UIView!
    
    
    var initialCenter: CGPoint!
    var upPosition: CGFloat!
    var downPosition: CGFloat!
    
    
    
    
    // VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upPosition = mrCleanImageView.center.y
        downPosition = upPosition + 300
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
   
    // FUNCTIONS
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        print("you tapped mr clean")
    }
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            NSLog("you started panning: \(initialCenter)")
            initialCenter = mrCleanImageView.center
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.mrCleanImageView.transform = CGAffineTransformMakeScale(1.1, 1.1)
            })
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            NSLog("translation: \(translation)")
            mrCleanImageView.center = CGPoint(x: translation.x + initialCenter.x, y: translation.y + initialCenter.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            NSLog("you finished panning: \(location)")
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.mrCleanImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                
                if velocity.y > 0 {
                    self.mrCleanImageView.center.y = self.downPosition
                } else {
                    self.mrCleanImageView.center.y = self.upPosition
                }
            })
        }
    }

    @IBAction func didPinch(sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print("\(scale)")
        mrCleanImageView.transform = CGAffineTransformMakeScale(scale, scale)
    }
    


}
