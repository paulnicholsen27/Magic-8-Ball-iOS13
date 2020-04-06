//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballPic: UIImageView!
    
    var askTimer: Timer?
    var colorChanges:Int = 0;
    var originalX:CGFloat = 0.0
    var originalY:CGFloat = 0.0
    
    override func viewDidLoad() {
        originalX = ballPic.frame.origin.x
        originalY = ballPic.frame.origin.y
    
    }
    
    @IBAction func askButton(_ sender: Any) {
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.changeColor()
            self.shakeYourBall()
            if self.colorChanges == 15 {
                timer.invalidate()
                self.colorChanges = 0
                self.ballPic.frame.origin.x = self.originalX
                self.ballPic.frame.origin.y = self.originalY
                self.ballPic.image = self.ballArray.randomElement()
            }
        }
    }

    func shakeYourBall() {
        let pixelShake = CGFloat(10)
        ballPic.frame.origin.x += CGFloat.random(in: -pixelShake ... pixelShake)
//        print(CGFloat.random(in: -2 ... -2))
        ballPic.frame.origin.y += CGFloat.random(in: -pixelShake ... pixelShake)
    }
    
    func changeColor() {
        colorChanges += 1
        var newColor = UIColor(red: CGFloat.random(in: 0 ... 255)/255,
        green: CGFloat.random(in: 0 ... 255)/255,
        blue: CGFloat.random(in: 0 ... 255)/255,
        alpha: 1.0)
        ballPic.backgroundColor = newColor
        self.view.backgroundColor = newColor
    }
    
    let ballArray = [#imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball5")]


}

