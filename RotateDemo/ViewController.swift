//
//  ViewController.swift
//  RotateDemo
//
//  Created by VTStudio on 2017/9/6.
//  Copyright © 2017年 VTStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var basketBallImageView: UIImageView!
    @IBOutlet weak var judoImageView: UIImageView!
    @IBOutlet weak var footballImageView: UIImageView!
    @IBOutlet weak var volleyballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rotate1(imageView: self.basketBallImageView, aCircleTime: 7.0)
        self.rotate2(imageView: self.judoImageView, aCircleTime: 5.0)
        self.rotate3(imageView: self.footballImageView, aCircleTime: 3.0)
        self.rotate4(imageView: self.volleyballImageView, aCircleTime: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotate1(imageView: UIImageView, aCircleTime: Double) { //CABasicAnimation
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: nil)
    }

    func rotate2(imageView: UIImageView, aCircleTime: Double) { //UIView
        
        UIView.animate(withDuration: aCircleTime/2, delay: 0.0, options: .curveLinear, animations: {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: { finished in
            UIView.animate(withDuration: aCircleTime/2, delay: 0.0, options: .curveLinear, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2))
            }, completion: { finished in
                self.rotate2(imageView: imageView, aCircleTime: aCircleTime)
            })
        })
    }
    
    func rotate3(imageView: UIImageView, aCircleTime: Double) { //CAKeyframeAnimation
        
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.duration = aCircleTime
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = .infinity
        animation.values = [0, Double.pi/2, Double.pi, Double.pi*3/2, Double.pi*2]
        //Percentage of each key frame
        animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 0.1),
                              NSNumber(value: 0.3), NSNumber(value: 0.8), NSNumber(value: 1.0)]
        
        imageView.layer.add(animation, forKey: "rotate")
    }
    
    func rotate4(imageView: UIImageView, aCircleTime: Double) { //Transform (Failed to be infinite)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(aCircleTime)
        UIView.setAnimationCurve(.linear)
        imageView.transform = imageView.transform.rotated(by: CGFloat(Double.pi))
        UIView.commitAnimations()
    }
    
}

