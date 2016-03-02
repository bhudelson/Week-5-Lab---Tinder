//
//  CardsViewController.swift
//  Week 5 Lab - Tinder
//
//  Created by Blake Hudelson on 3/1/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    //OUTLETS
    @IBOutlet weak var navBarView: UIImageView!
    @IBOutlet weak var actionButtonView: UIImageView!
    @IBOutlet weak var cardView: UIImageView!
    
    
    //VARIABLES
    var cardInitialCenter: CGPoint!
    
    var swipedRightPosition: CGFloat!
    var snappedBackPosition: CGFloat!
    var swipedLeftPosition: CGFloat!
    
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    
    //VIEW DID LOAD
    override func viewDidLoad() {
        
        snappedBackPosition = cardView.center.x
        swipedRightPosition = cardView.center.x + 320
        swipedLeftPosition = cardView.center.x - 320
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //ON PAN CARD
    @IBAction func onPanCard(sender: UIPanGestureRecognizer) {
        
//        var offset = cardView.contentOffset.x
        
        print("pan now")
        
        let translation = sender.translationInView(view)
        
//        var cardrotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        //Began
        if sender.state == UIGestureRecognizerState.Began {
            cardInitialCenter = cardView.center
            
            UIView.animateWithDuration(0.4, delay: 0.0,
                // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                options: [UIViewAnimationOptions.Autoreverse],animations: { () -> Void in
                        self.cardView.transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
                }, completion: nil)
            
            
            
        }
        
            //Changed
        else if sender.state == UIGestureRecognizerState.Changed {
            self.cardView.center = CGPoint(x: translation.x + cardInitialCenter.x, y: cardInitialCenter.y)
    }
        
            //Ended
        else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                
                
                //Pan to right, animate offscreen to right
                if translation.x >= 50 {
                    self.cardView.center.x = self.swipedRightPosition
                }
                    
                //Pan to left, animate offscreen to left
                if translation.x <= -50 {
                    self.cardView.center.x = self.swipedLeftPosition
                }
                
                //Pan in each direction
                else {
                    self.cardView.center.x = self.snappedBackPosition
                    
                    
                }

                
        })
    }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
