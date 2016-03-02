//
//  CardsViewController.swift
//  Week 5 Lab - Tinder
//
//  Created by Blake Hudelson on 3/1/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var navBarView: UIImageView!
    @IBOutlet weak var actionButtonView: UIImageView!
    @IBOutlet weak var cardView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPanCard(sender: UIPanGestureRecognizer) {
        
        print("pan now")
        
        let translation = sender.translationInView(view)
        
        //Began
        if sender.state == UIGestureRecognizerState.Began {
            cardInitialCenter = cardView.center
            
            cardView.transform = CGAffineTransformRotate(cardView.transform,CGFloat(45 * M_PI / 180))
            
            
        }
        
            //Changed
        else if sender.state == UIGestureRecognizerState.Changed {
            self.cardView.center = CGPoint(x: translation.x + cardInitialCenter.x, y: cardInitialCenter.y)
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
