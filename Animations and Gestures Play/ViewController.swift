//
//  ViewController.swift
//  Animations and Gestures Play
//
//  Created by Corwin Crownover on 2/15/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mrCleanImageView: UIView!
    @IBOutlet weak var totoroImageView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func onTotoraTap(sender: AnyObject) {
        print("come visit mr clean")
        
        mrCleanImageView.alpha = 0
        mrCleanImageView.center.y = 50
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.mrCleanImageView.alpha = 1
            self.mrCleanImageView.center.y = 380
            }) { (Bool) -> Void in
                
                
                UIView.animateWithDuration(0.3, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
                    self.mrCleanImageView.transform = CGAffineTransformMakeRotation(CGFloat(20 * M_PI/180)) }, completion: nil)
        }
        
        UIView.animateWithDuration(0.3, delay: 1.3, usingSpringWithDamping: CGFloat(0.25), initialSpringVelocity: 0, options: [], animations: { () -> Void in self.totoroImageView.center.y = 100
            }, completion: nil)
    }
    
    
    
}

